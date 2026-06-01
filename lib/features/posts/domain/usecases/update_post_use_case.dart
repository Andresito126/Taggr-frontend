import 'package:taggr/features/posts/domain/entities/post.dart';
import 'package:taggr/features/posts/domain/repositories/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository _repository;
  UpdatePostUseCase(this._repository);

  Future<Post> call(
    String id, 
    String title, 
    String description, 
    String category, 
    List<String> tags,
  ) => _repository.updatePost(id, title, description, category, tags);
}