import 'package:taggr/features/posts/domain/entities/post.dart';

sealed class PostUiState {}

class PostInitial extends PostUiState {}

class PostLoading extends PostUiState {}

class PostLoaded extends PostUiState {
  final List<Post> posts;
  
  PostLoaded(this.posts);
}

class PostError extends PostUiState {
  final String message;
  
  PostError(this.message);
}