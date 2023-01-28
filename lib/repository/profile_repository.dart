import 'package:posted_social_media/api/profile_api.dart';
import 'package:posted_social_media/model/user_model.dart';
import 'package:posted_social_media/model/user_only_model.dart';
import 'package:posted_social_media/response/profile_response.dart';

class ProfileRepository {
  //view profile by id
  Future<ProfileResponse?> profileById(String username) async {
    return await ProfileApi().profileById(username);
  }

  // edit profile
  Future<bool> editProfile(UserOnly user) async {
    return await ProfileApi().editProfile(user);
  }

  // follow unfollow users
  Future<bool> followUnfollow(String id) async {
    return await ProfileApi().followUnfollow(id);
  }
}
