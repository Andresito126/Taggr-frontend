import 'package:flutter/material.dart';
import 'package:taggr/shared/components/dropdown_field.dart';
import 'package:taggr/shared/components/input_field.dart';
import 'package:taggr/shared/components/title_section.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: TitleSection(title: "Create", sizeFont: 36),
        //titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.borderWhite, height: 1.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // child: Padding(padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: SizedBox(
            width: double.infinity,
            // margin: const EdgeInsets.only(bottom: 16, top: 16),
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
                        Icon(Icons.upload_file_outlined, size: 48),
                        SizedBox(height: 10),
                        Text(
                          "Click to upload your art",
                          style: AppTextStyles.caption,
                        ),
                        SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      InputField(
                        textInput: "Description",
                        hTPlaceHolder: "Tell your story",
                        iconInput: Icons.description_outlined,
                        colorField: AppColors.surface,
                        controller: _descriptionController,
                      ),
                      SizedBox(height: 10),
                      DropdownField(
                        textInput: "Category",
                        hTPlaceHolder: "Select categor",
                        iconInput: Icons.category_outlined,
                        items: ["Mural", "Sticker", "Wildstyle", "Stencil"],
                        onChanged: (value) {
                          _categoryController.text = value ?? "";
                        },
                      ),
                      SizedBox(height: 10),
                      InputField(
                        textInput: "Tags",
                        hTPlaceHolder: "urban, spray, wildstyle",
                        iconInput: Icons.tag_outlined,
                        colorField: AppColors.surface,
                        controller: _tagsController,
                      ),
                      SizedBox(height: 10),

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
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neonGreen,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      "POST",
                      style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
