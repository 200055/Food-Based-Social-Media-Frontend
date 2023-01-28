import 'package:flutter_test/flutter_test.dart';
import 'package:posted_social_media/model/user_model.dart';
import 'package:posted_social_media/repository/post_repository.dart';
import 'package:posted_social_media/repository/profile_repository.dart';
import 'package:posted_social_media/repository/user_repository.dart';
import 'package:posted_social_media/response/profile_response.dart';

void main() {
  late UserRepository? userRepository;
  String? token;

  late PostRepository? postRepository;
  late ProfileRepository? profileRepository;
  late ProfileResponse? profileResponse;

  setUp(() {
    userRepository = UserRepository();
    postRepository = PostRepository();
    profileRepository = ProfileRepository();
    profileResponse = ProfileResponse();

    String token =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZDViNDM4MTQ1NTZlM2M3NDM3ZGIzZCIsImlhdCI6MTY1OTUxMzIyNiwiZXhwIjoxNjYyMTA1MjI2fQ.kJo8WCkF76ckusN9FCYbRy_5VIn1tI8jW0nxMDS7dBo';
  });

  test('Sign Up Test', () async {
    bool expectedResult = true;
    User user = User(
        username: 'prabesh',
        email: 'prabesh1323@gmail.com',
        password: 'prabessah123');
    bool actualResult = await userRepository!.registerUser(user);

    expect(expectedResult, actualResult);
  });

  test('Login User', () async {
    bool expectedResult = true;
    String email = 'testyal@gmail.com';
    String password = 'testyal';

    bool acutalValue = await UserRepository().login(email, password);
    expect(expectedResult, acutalValue);
  });

  test('View Post', () async {
    bool expectedResult = false;
    List<dynamic> lstpost = await PostRepository().getPosts();
    // debugPrint(lstpost[0]["isLiked"].toString());
    bool acutalValue = lstpost[0]["isLiked"];
    expect(expectedResult, acutalValue);
  });

  test('View Profile', () async {
    bool expectedResult = true;
    ProfileResponse? lstProfile =
        await ProfileRepository().profileById('apitesterreal');
    bool acutalValue = lstProfile!.user!.isVerified!;
    expect(expectedResult, acutalValue);
  });


  tearDown(() {
    userRepository = null;
  });
}
