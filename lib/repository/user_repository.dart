import 'package:posted_social_media/api/user_api.dart';
import 'package:posted_social_media/model/user_model.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserApi().login(email, password);
  }
}
