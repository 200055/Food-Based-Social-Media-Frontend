import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posted_social_media/screen/login.dart';
import 'package:posted_social_media/screen/signup.dart';
import 'package:posted_social_media/screen/welcome.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Welcome to login',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/loginscreen': (context) => const LoginScreen(),
        },
        home: const WelcomeScreen(),
      ),
    );
    Finder login = find.byKey(const ValueKey('login'));
    await tester.tap(login);
  });

  testWidgets('Welcome to register',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/signupscreen': (context) => const SignUpScreen(),
        },
        home: const WelcomeScreen(),
      ),
    );
    Finder register = find.byKey(const ValueKey('register'));
    await tester.tap(register);
  });
}
