import 'package:taggr/features/posts/domain/entities/post.dart';
import 'package:taggr/features/posts/domain/repositories/post_repository.dart';

class GetAllPostUseCase {
  final PostRepository _repository;

  GetAllPostUseCase(this._repository);

  Future<List<Post>> call() => _repository.getAllPosts();
}
