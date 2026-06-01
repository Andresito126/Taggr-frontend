import 'package:taggr/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  //en la img url lo quitare por el momento, no necesito las imgs, va a ser pedillo
  Future<Post> createPost(
    String title,
    String description,
    String category,
    List<String> tags
  );

  Future<List<Post>> getAllPosts();

  Future <Post> getPostById(String id);

  Future<Post> updatePost(
    String id,
    String title,
    String description,
    String category,
    List<String> tags
  );

  Future<void> deletePost(String id);

  
  
}
