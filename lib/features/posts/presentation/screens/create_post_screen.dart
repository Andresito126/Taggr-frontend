import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taggr/features/posts/presentation/providers/post_provider.dart';
import 'package:taggr/features/posts/presentation/providers/post_ui_state.dart';
import 'package:taggr/shared/components/dropdown_field.dart';
import 'package:taggr/shared/components/input_field.dart';
import 'package:taggr/shared/components/title_section.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class CreatePostScreen extends StatefulWidget {
  final Map<String, dynamic>? postToEdit;

  const CreatePostScreen({super.key, this.postToEdit});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  String? _selectedCategory;
  final List<String> _categories = ["Graffiti", "Tatto", "Digital Art", "Stickers", "Urban Photography"];

  @override
void initState() {
    super.initState();

    if (widget.postToEdit != null) {
      _titleController.text = widget.postToEdit!['title'] ?? '';
      _descriptionController.text = widget.postToEdit!['description'] ?? '';
      
      if (_categories.contains(widget.postToEdit!['category'])) {
        _selectedCategory = widget.postToEdit!['category'];
        _categoryController.text = _selectedCategory!;
      }

      if (widget.postToEdit!['tags'] != null) {
        final List<String> loadedTags = widget.postToEdit!['tags'];
        _tagsController.text = loadedTags.join(', ');
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

void _submitPost() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final category = _categoryController.text.trim();
    final tagsText = _tagsController.text.trim();

    if (title.isEmpty || category.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title and Category are required!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    List<String> tagsList = [];
    if (tagsText.isNotEmpty) {
      tagsList = tagsText.split(',').map((e) => e.trim()).toList();
    }

    final provider = context.read<PostProvider>();
    
    final isEditing = widget.postToEdit != null && widget.postToEdit!.containsKey('id');
    
    if (isEditing) {
      final idToEdit = widget.postToEdit!['id'];
      await provider.updatePost(idToEdit, title, description, category, tagsList);
    } else {
      await provider.createPost(title, description, category, tagsList);
    }

    if (!mounted) return;

    final state = provider.state;
    if (state is PostError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const TitleSection(title: "Create", sizeFont: 36),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.borderWhite, height: 1.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16, top: 16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36),
                    child: Column(
                      children: [
                        const Icon(Icons.upload_file_outlined, size: 48),
                        const SizedBox(height: 10),
                        Text(
                          "Click to upload your art",
                          style: AppTextStyles.caption,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "PNG, JPG up to 10MB",
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                        textInput: "Title",
                        hTPlaceHolder: "Enter the title of your post",
                        iconInput: Icons.edit_document,
                        colorField: AppColors.surface,
                        controller: _titleController,
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        textInput: "Description",
                        hTPlaceHolder: "Tell your story",
                        iconInput: Icons.description_outlined,
                        colorField: AppColors.surface,
                        controller: _descriptionController,
                      ),
                      const SizedBox(height: 10),
                      DropdownField(
                        textInput: "Category",
                        hTPlaceHolder: "Select category",
                        iconInput: Icons.category_outlined,
                        items: const ["Mural", "Sticker", "Wildstyle", "Stencil"],
                        onChanged: (value) {
                          _categoryController.text = value ?? "";
                        },
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        textInput: "Tags",
                        hTPlaceHolder: "urban, spray, wildstyle",
                        iconInput: Icons.tag_outlined,
                        colorField: AppColors.surface,
                        controller: _tagsController,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Separate tags with commas",
                        style: AppTextStyles.caption,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Consumer<PostProvider>(
                    builder: (context, provider, child) {
                      final isLoading = provider.state is PostLoading;

                      return ElevatedButton(
                        onPressed: isLoading ? null : _submitPost,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.neonGreen,
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          disabledBackgroundColor: Colors.grey[800],
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "POST",
                                style: AppTextStyles.title.copyWith(
                                  color: isLoading ? Colors.white54 : Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}