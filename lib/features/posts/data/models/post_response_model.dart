import 'package:taggr/features/posts/domain/entities/post.dart';

class PostResponseModel extends Post {
  PostResponseModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.description,
    required super.category,
    required super.tags,
  });

factory PostResponseModel.fromJson(Map<String, dynamic> json) {
    List<String> parsedTags = [];

    if (json['tags'] != null) {
      if (json['tags'] is String) {
        String rawTags = json['tags'].toString().replaceAll('{', '').replaceAll('}', '');
        if (rawTags.trim().isNotEmpty) {
          parsedTags = rawTags.split(',').map((e) => e.trim()).toList();
        }
      } else if (json['tags'] is Iterable) {
        parsedTags = (json['tags'] as Iterable).map((e) => e.toString()).toList();
      }
    }

    return PostResponseModel(
      id: json['id'].toString(),
      userId: json['user_id']?.toString() ?? '',
      title: json['title']?.toString() ?? 'Sin título',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? 'General',
      tags: parsedTags,
    );
  }
}