import 'package:taggr/core/di/app_container.dart';
import 'package:taggr/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:taggr/features/posts/data/repositories/post_repository_impl.dart';
import 'package:taggr/features/posts/domain/repositories/post_repository.dart';
import 'package:taggr/features/posts/domain/usecases/create_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/delete_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/get_all_post_use_case.dart';
import 'package:taggr/features/posts/domain/usecases/update_post_use_case.dart';
import 'package:taggr/features/posts/presentation/providers/post_provider.dart';

//la instanciacionn de todo!!!!
class PostModule {
  final AppContainer _container;

  PostModule(this._container);

  // 1. instanciacion el DS inyectando el apicliente del coreeeeeeeee
  PostRemoteDataSource get _postRemoteDataSource => 
      PostRemoteDataSource(_container.apiClient);

  // 2. instanciacion el repo inyectando el DataSource
  PostRepository get _postRepository => 
      PostRepositoryImpl(_postRemoteDataSource);

  // 3. instanciacion los usecases inyectandos el repo
  CreatePostUseCase get createPostUseCase => 
      CreatePostUseCase(_postRepository);
      
  GetAllPostUseCase get getAllPostsUseCase => 
      GetAllPostUseCase(_postRepository);
      
  UpdatePostUseCase get updatePostUseCase => 
      UpdatePostUseCase(_postRepository);
      
  DeletePostUseCase get deletePostUseCase => 
      DeletePostUseCase(_postRepository);

  
  PostProvider providePostProvider() {
    return PostProvider(
      createPostUseCase: createPostUseCase,
      getAllPostsUseCase: getAllPostsUseCase,
      updatePostUseCase: updatePostUseCase,
      deletePostUseCase: deletePostUseCase,
    );
  }
  
}