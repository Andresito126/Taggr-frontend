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
    return PostResponseModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      tags: List<String>.from(json['tags'] ?? []), 
    );
  }
}