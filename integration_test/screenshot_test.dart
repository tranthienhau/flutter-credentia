import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_credentia/main.dart';

Future<void> main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture key Credentia screens', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: CredentiaApp()));
    await tester.pumpAndSettle();

    // 01 - onboarding welcome
    await binding.convertFlutterSurfaceToImage();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('01-onboarding-welcome');

    await tester.tap(find.byKey(const Key('get-started-button')));
    await tester.pumpAndSettle();

    // 02 - signup role select
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('02-signup-role-select');

    await tester.tap(find.byKey(const Key('role-dentist')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('signup-continue-button')));
    await tester.pumpAndSettle();

    // 03 - credential verification
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('03-credential-verification');

    await tester.tap(find.byKey(const Key('submit-verification-button')));
    await tester.pumpAndSettle();

    // 04 - feed home (main shell default tab)
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('04-feed-home');

    // 05 - discover search
    await tester.tap(find.byKey(const Key('nav-tab-discover')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('05-discover-search');

    // 06 - professional profile
    await tester.tap(find.text('Dr. Elena Rodriguez').first);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('06-professional-profile');
    await tester.tap(find.byKey(const Key('professional-profile-back-button')));
    await tester.pumpAndSettle();

    // 07 - messages inbox
    await tester.tap(find.byKey(const Key('nav-tab-messages')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('07-messages-inbox');

    // 08 - chat thread
    await tester.tap(find.text('Dr. Marcus Thorne').first);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('08-chat-thread');
    await tester.tap(find.byType(BackButton).first);
    await tester.pumpAndSettle();

    // 09 - notifications
    await tester.tap(find.byKey(const Key('nav-tab-notifications')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('09-notifications');

    // 10 - my profile
    await tester.tap(find.byKey(const Key('nav-tab-profile')));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 300));
    await binding.takeScreenshot('10-my-profile');
  });
}
