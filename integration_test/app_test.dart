import 'package:flab/testing/testing_demo.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var emailField = find.byType(TextFormField).first;
      var passwordField = find.byType(TextFormField).last;
      var loginButton = find.byType(ElevatedButton).first;

      // Enter text for the email address
      await tester.enterText(emailField, 'flutterexp@gmail.com');
      await Future.delayed(Duration(seconds: 2));

      // Enter text for the password
      await tester.enterText(passwordField, '123456');
      await Future.delayed(Duration(seconds: 2));

      await tester.tap(loginButton);
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();

      var firstCheckbox = find.byType(Checkbox).first;

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: false,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true),
      );

      await tester.tap(firstCheckbox);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 2));

      expect(
        tester.getSemantics(firstCheckbox),
        matchesSemantics(
            hasTapAction: true,
            hasCheckedState: true,
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
            isFocusable: true),
      );
    });
  });
}

/*void main() {
  group('App Test', () {
    // TODO 3: Add the IntegrationTestWidgetsFlutterBinding and .ensureInitialized
    // TODO 4: Create your test case
    testWidgets("full app test", (tester) async {
      // TODO 6: execute the app.main() function
      // TODO 7: Wait until the app has settled
      // TODO 8: create finders for email, password and login
      // TODO 9: Enter text for the email address
      // TODO 10: Enter text for the password
      // TODO 11: Tap on the login button and wait till it settled
      // TODO 12: Find the first checkbox in the screen
      // TODO 13: Check the semantics of the checkbox if it is not checked
      // TODO 13: Tap on the checkbox and wait till it settled
      // TODO 14: Expect the result to be checked
    });
  });
}*/
