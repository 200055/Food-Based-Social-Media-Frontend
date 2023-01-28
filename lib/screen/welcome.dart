import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.5,
                  // width: width * 2,
                  child: Image.asset(
                    'assets/images/welcome_hello.png',
                    scale: 0.2,
                  ),
                ),
                // const SizedBox(height: 30),
                const Text(
                  'Welcome To',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                // const SizedBox(height: 30),
                Image.asset('assets/images/logo_dark_smaller.png'),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    key: const ValueKey('login'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginscreen');
                    },
                    child: const Text(
                      'Login',
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
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    key: const ValueKey('register'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signupscreen');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
