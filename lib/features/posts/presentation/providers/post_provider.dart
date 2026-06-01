import 'package:flutter/material.dart';
import 'package:taggr/features/posts/domain/usecases/create_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/get_all_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/update_post_use_case.dart';
import 'package:taggr/features/posts/presentation/providers/post_ui_state.dart';

class PostProvider extends ChangeNotifier {
  final CreatePostUseCase createPostUseCase;
  final GetAllPostUseCase getAllPostsUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;

  PostProvider({
    required this.createPostUseCase,
    required this.getAllPostsUseCase,
    required this.updatePostUseCase,
    required this.deletePostUseCase,
  });

  PostUiState _state = PostInitial();
  PostUiState get state => _state;

  void _emit(PostUiState newState) {
    _state = newState;
    notifyListeners(); 
  }

  Future<void> loadPosts() async {
    _emit(PostLoading()); 
    try {
      final posts = await getAllPostsUseCase();
      _emit(PostLoaded(posts)); 
    } catch (e) {
      _emit(PostError(_formatError(e)));
    }
  }

  Future<void> createPost(String title, String description, String category, List<String> tags) async {
    _emit(PostLoading());
    try {
      await createPostUseCase(title, description, category, tags);

      await loadPosts(); 
    } catch (e) {
      _emit(PostError(_formatError(e)));
    }
  }

  Future<void> deletePost(String id) async {
    _emit(PostLoading());
    try {
      await deletePostUseCase(id);
      await loadPosts();
    } catch (e) {
      _emit(PostError(_formatError(e)));
    }
  }

  String _formatError(Object e) {
    return e.toString().replaceAll('Exception: ', '');
  }
}