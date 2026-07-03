import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/auth/presentation/views/login_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginView renders its fields and submit button', (tester) async {
    // A View can be pumped in isolation: it only depends on its ViewModel,
    // whose initial state has no external dependencies.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: LoginView()),
      ),
    );

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(FilledButton, 'Sign in'), findsOneWidget);
  });
}
