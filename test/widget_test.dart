import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_credentia/main.dart';

void main() {
  testWidgets('App boots to the onboarding welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: CredentiaApp()));
    await tester.pumpAndSettle();

    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Credentia'), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
  });
}
