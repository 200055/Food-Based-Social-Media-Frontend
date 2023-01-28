import 'package:posted_social_media/api/post_api.dart';
import 'package:posted_social_media/model/post_model.dart';

class PostRepository {
  // to view posts
  Future<List<dynamic>> getPosts() async {
    return await PostApi().getPosts();
  }

  // add post
  Future<bool> createPost(PostModel postModel) async {
    return await PostApi().createPost(postModel);
  }

  //like post
  Future<bool> likePost(String postId) async {
    return await PostApi().likePost(postId);
  }

}
