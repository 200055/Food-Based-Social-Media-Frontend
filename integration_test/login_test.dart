import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:posted_social_media/screen/homepage.dart';
import 'package:posted_social_media/screen/login.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/navigation': (context) => const HomepageScreen(),
        },
        home: const LoginScreen(),
      ),
    );
    // Finder title = find.text('Arthemetics');
    // expect(title, findsOneWidget);
    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'testyal@gmail.com');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'testyal');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    // expect(find.text('Home'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
