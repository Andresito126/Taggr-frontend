import 'package:flutter/material.dart';
import 'package:taggr/features/posts/presentation/screens/create_post_screen.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class PostCard extends StatefulWidget {
  final String imageUrl;
  final String category;
  final String userName;
  final String title;
  final String description;
  final int likes;
  final int comments;

  const PostCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.userName,
    required this.title,
    required this.description,
    required this.likes,
    required this.comments,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey[900],
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image, color: Colors.white24),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  color: Colors.black.withOpacity(0.8),
                  child: Text(
                    widget.category.toUpperCase(),
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.neonGreen,
                      fontSize: 16,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.neonGreen,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.userName[0].toUpperCase(),
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      widget.userName,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: AppTextStyles.subtitle.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.neonBlue, height: 1),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(widget.likes.toString(), style: AppTextStyles.caption),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.chat_bubble_outline,
                      color: AppColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.comments.toString(),
                      style: AppTextStyles.caption,
                    ),

                    const Spacer(),

                    Theme(
                      data: Theme.of(
                        context,
                      ).copyWith(cardColor: AppColors.surface),
                      child: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_horiz_outlined,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                        offset: const Offset(0, 40),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white12, width: 1),
                          borderRadius: BorderRadius.zero,
                        ),

                        //POR EL MOMENTO LLLLLLLLLLLLLLLLLLLLO DEJO ASIIIIIIIIIIIIIIIIIII
                        onSelected: (String action) {
                          if (action == 'save') {
                            print("Guardar post: ${widget.title}");
                          } else if (action == 'edit') {
                            // le mandamos la data paara crearaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreatePostScreen(
                                  postToEdit: {
                                    'title': widget.title,
                                    'description': widget.description,
                                    'category': widget.category,
                                  },
                                ),
                              ),
                            );
                          } else if (action == 'delete') {
                            print("Eliminar post: ${widget.title}");
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'save',
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: AppColors.textPrimary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Text('Save', style: AppTextStyles.body),
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.edit_outlined,
                                      color: AppColors.textPrimary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Text('Edit', style: AppTextStyles.body),
                                  ],
                                ),
                              ),
                              const PopupMenuDivider(height: 1),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Delete',
                                      style: AppTextStyles.body.copyWith(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
