import 'package:flutter/material.dart';
import 'package:posted_social_media/model/user_model.dart';
import 'package:posted_social_media/repository/user_repository.dart';
import 'package:posted_social_media/utils/show_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

    _registerUser(User user) async {
    bool isSignup = await UserRepository().registerUser(user);
    if (isSignup) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      Navigator.pushReplacementNamed(context, '/loginscreen');
      displaySuccessMessage(context, "Register Success");
    } else {
      displayErrorMessage(context, "Register Failed");
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: height * 0.30,
                        // width: width * 2,
                        child: Image.asset(
                          'assets/images/signup_img.png',
                          scale: 0.2,
                        ),
                      ),
                      Positioned(
                        left: -12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: const Color(0xff754A4A),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/loginscreen');
                          },
                          child: const Icon(
                            Icons.cancel_rounded,
                            size: 45,
                            // color: Colors.blac,
                          ),
                        ),
                      ),
                    ]),
                    // const SizedBox(height: 30),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Georgia',
                      ),
                    ),
                    // const SizedBox(height: 30),
                    // const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _fullName,
                            decoration: const InputDecoration(
                              hintText: 'Full Name',
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter First Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Date of Birth';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _password,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Date of Birth';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 4),
                          Stack(
                            children: [
                              Positioned.fill(
                                left: 40,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'By checking this mark I agree to the Terms & Conditions and Privacy Policy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: const Color(0xff754A4A),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.07,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            User user = User(
                              name: _fullName.text,
                              email: _email.text,
                              password: _password.text,
                            );
                            _registerUser(user);
                          }
                          // Navigator.pushNamed(context, '/loginscreen');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff754A4A),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
