import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posted_social_media/screen/login.dart';
import 'package:posted_social_media/screen/signup.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Sign Up Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/loginscreen': (context) => const LoginScreen(),
        },
        home: const SignUpScreen(),
      ),
    );
    Finder txtFullName = find.byKey(const ValueKey('txtFullName'));
    await tester.enterText(txtFullName, 'Test MePls');
    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'paryal@tesstaa.com');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'prabessh123');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
