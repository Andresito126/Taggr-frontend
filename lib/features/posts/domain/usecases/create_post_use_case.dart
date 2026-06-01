import 'package:taggr/features/posts/domain/entities/post.dart';
import 'package:taggr/features/posts/domain/repositories/post_repository.dart';

class CreatePostUseCase {
  final PostRepository _repository;
  CreatePostUseCase(this._repository);

  Future<Post> call(String title, String description, String category, List<String> tags) =>
      _repository.createPost(title, description, category, tags);
}
