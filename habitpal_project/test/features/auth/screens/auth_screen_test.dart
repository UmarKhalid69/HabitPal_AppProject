import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habitpal_project/features/auth/screens/forgot_password.dart';
import 'package:habitpal_project/features/auth/screens/login.dart';
import 'package:habitpal_project/features/auth/screens/signup.dart';
import 'package:habitpal_project/features/settings/screens/change_username.dart';
import 'package:habitpal_project/features/settings/screens/settings.dart';
import 'package:habitpal_project/widgets/google_sign_in.dart';
// Replace with the actual path to your LogInScreen widget

void main() {
  group(
    "Login Screen Test",
    () {
      testWidgets(
        'LogInScreen Widget Test',
        (WidgetTester tester) async {
          // Build our app and trigger a frame.
          await tester.pumpWidget(const MaterialApp(home: LogInScreen()));

          // Verify the existence of certain widgets
          expect(find.text('Enter Email'), findsOneWidget);
          expect(find.text('Password'), findsOneWidget);
          expect(find.text('Forgot Password?'), findsOneWidget);
          expect(find.text('Log In'), findsOneWidget);
          expect(find.byType(GoogleSignInButton), findsOneWidget);

          // Adjust the expectation for the text since it includes a line break in the actual widget
          expect(find.text("Don't have account? "), findsOneWidget);

          // Enter text in the text fields
          await tester.enterText(
              find.byType(TextField).at(0), 'test@example.com');
          await tester.enterText(find.byType(TextField).at(1), 'password');

          // Tap the "Log In" button
          await tester.tap(find.text('Log In'));

          // Wait for the UI to respond
          await tester.pump();

          // // Verify that the expected dialogs are displayed
          // // Note: You may need to adjust this based on your actual implementation
          expect(find.text('Incorrect email or password'), findsNothing);
          expect(find.text('Account locked. Please try again later.'),
              findsNothing);
        },
      );
    },
  );

  group("Signup Screen Testing", () {
    testWidgets('SignUpScreen Widget Test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: SignUpScreen()));

      // Verify the existence of certain widgets
      expect(find.textContaining('Sign Up'), findsNWidgets(2));
      expect(find.text('Enter Username'), findsOneWidget);
      expect(find.text('Enter Email ID'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Already have an account? '), findsOneWidget);
      expect(find.text('Log In'), findsOneWidget);

      // Enter text in the text fields
      await tester.enterText(find.byType(TextField).at(0), 'TestUsername');
      await tester.enterText(find.byType(TextField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(2), 'password');
      await tester.enterText(find.byType(TextField).at(3), 'password');

      // Wait for the UI to respond
      await tester.pump();

      // Verify that the expected dialogs are displayed
      expect(find.text('Password and Confirm Password do not match.'),
          findsNothing);
    });
  });

  group("Forgot Password", () {
    testWidgets('ForgotPassword Widget Test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: ResetPassword()));

      // Verify the existence of certain widgets
      expect(find.text('Forgot Password'), findsOneWidget);
      expect(find.text('Enter Email Id'), findsOneWidget);
      expect(find.text('Reset Password'), findsOneWidget);
    });
  });

  group("Settings Change username", () {
    testWidgets('Settings Widget Test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: ChangeUsername()));

      // Verify the existence of certain widgets
      expect(find.text('Change Username'), findsOneWidget);
      expect(find.text('New Username'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
    });
    
  });
}