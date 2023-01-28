import 'package:flutter/material.dart';
import 'package:posted_social_media/screen/editprofile.dart';
import 'package:posted_social_media/screen/homepage.dart';
import 'package:posted_social_media/screen/login.dart';
import 'package:posted_social_media/screen/otherProfile.dart';
import 'package:posted_social_media/screen/postpage.dart';
import 'package:posted_social_media/screen/signup.dart';
import 'package:posted_social_media/screen/wearOsHome.dart';
import 'package:posted_social_media/screen/wear_os_login.dart';
import 'package:posted_social_media/screen/wear_other_profile.dart';
import 'package:posted_social_media/screen/welcome.dart';
import 'package:posted_social_media/widgets/bottom_nav.dart';
import 'package:posted_social_media/widgets/splash.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff754A4A),
        fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/loginscreen': (context) => const LoginScreen(),
        '/navigation': (context) => const BottomNavigator(),
        '/signupscreen': (context) => const SignUpScreen(),
        '/homescreen': (context) => const HomepageScreen(),
        '/otherprofilescreen': (context) => const OtherProfileScreen(),
        '/postscreen': (context) => const PostScreen(),
        '/editprofilescreen': (context) => const EditProfileScreen(),
        '/wearlogin': (context) => const WearLoginScreen(),
        '/wearhome': (context) => const WearHomepageScreen(),
        '/wearotherprofile': (context) => const WearOtherProfileScreen(),
      },
    ),
  );
}
