import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:posted_social_media/model/user_model.dart';
import 'package:posted_social_media/model/user_only_model.dart';
import 'package:posted_social_media/repository/profile_repository.dart';
import 'package:posted_social_media/response/profile_response.dart';
import 'package:posted_social_media/utils/show_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();
  String? userId = '';
  String? username = '';
  List<String>? lstPost;

  @override
  void initState() {
    callIdUser();
    super.initState();
  }

  callIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString("userId");
      username = prefs.getString("username");
      lstPost = prefs.getStringList("lstPost");
    });
  }

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushReplacementNamed(context, '/navigation');
    } else {
      MotionToast.error(
        description: const Text('Email/Password Incorrect'),
      ).show(context);
    }
  }

  _editUser(UserOnly user) async {
    bool isUpdated = await ProfileRepository().editProfile(user);
    if (isUpdated) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isUpdated) {
    if (isUpdated) {
      setState(() {
        Navigator.pushNamed(context, '/navigation');
      });
      displaySuccessMessage(context, "Update Success");
    } else {
      displayErrorMessage(context, "Update Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(lstPost.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text('Your Profile'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff754A4A),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/navigation');
          },
        ),
      ),
      body: FutureBuilder<ProfileResponse?>(
        future: ProfileRepository().profileById('$username'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              User userDetail = snapshot.data!.user!;

              _fNameController.text = userDetail.name!;
              _bioController.text = userDetail.bio!;
              _emailController.text = userDetail.email!;
              _usernameController.text = userDetail.username!;
              return Container(
                padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        '${userDetail.image}',
                                      ))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      buildTextField("Full Name", userDetail.name!, false,
                          _fNameController),
                      buildTextField(
                          "E-mail", userDetail.email!, false, _emailController),
                      buildTextField("Username", userDetail.username!, false,
                          _usernameController),
                      buildTextField(
                          "Bio", userDetail.bio!, false, _bioController),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff754A4A),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                            ),
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              UserOnly user = UserOnly(
                                id: userDetail.id,
                                name: _fNameController.text,
                                email: _emailController.text,
                                username: _usernameController.text,
                                bio: _bioController.text,
                              );
                              _editUser(user);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff754A4A),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60)),
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff754A4A)),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, TextEditingController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: false,
        controller: TextEditingController,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
