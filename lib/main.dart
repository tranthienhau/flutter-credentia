import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/onboarding/onboarding_welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: CredentiaApp()));
}

class CredentiaApp extends StatelessWidget {
  const CredentiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credentia',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const OnboardingWelcomeScreen(),
    );
  }
}
