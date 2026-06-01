import 'package:taggr/features/posts/domain/repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository _repository;
  DeletePostUseCase(this._repository);

  Future<void> call(String id) => _repository.deletePost(id);
}