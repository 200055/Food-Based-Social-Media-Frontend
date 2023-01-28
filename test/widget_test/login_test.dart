import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posted_social_media/screen/homepage.dart';
import 'package:posted_social_media/screen/login.dart';

void main() {
  testWidgets('Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/homescreen': (context) => const HomepageScreen(),
        },
        home: const LoginScreen(),
      ),
    );
    // Finder title = find.text('Arthemetics');
    // expect(title, findsOneWidget);
    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'paryal@test.com');
    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'prabesh123');
    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    // expect(find.text('Home'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
