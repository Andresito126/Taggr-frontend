import 'package:taggr/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:taggr/features/posts/data/models/create_post_request_model.dart';
import 'package:taggr/features/posts/data/models/update_post_request_model.dart';
import 'package:taggr/features/posts/domain/entities/post.dart';
import 'package:taggr/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _dataSource;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<Post> createPost(
    String title, 
    String description, 
    String category, 
    List<String> tags,
  ) async {
    // donde se empaqueta los datos en el modelo
    final request = CreatePostRequestModel(
      title: title,
      description: description,
      category: category,
      tags: tags,
    );

    // se manda al datasoruce y se retornaa
    return await _dataSource.createPost(request);
  }

  @override
  Future<List<Post>> getAllPosts() async {
    return await _dataSource.getAllPosts();
  }

  @override
  Future<Post> updatePost(
    String id, 
    String title, 
    String description, 
    String category, 
    List<String> tags,
  ) async {
  
    final request = UpdatePostRequestModel(
      title: title,
      description: description,
      category: category,
      tags: tags,
    );

    return await _dataSource.updatePost(id, request);
  }

  @override
  Future<void> deletePost(String id) async {
    return await _dataSource.deletePost(id);
  }
}