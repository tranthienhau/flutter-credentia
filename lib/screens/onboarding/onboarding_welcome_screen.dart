import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'signup_role_select_screen.dart';
import 'login_screen.dart';

class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  gradient: AppColors.gradient,
                  borderRadius: BorderRadius.circular(48),
                ),
                alignment: Alignment.center,
                child: Text(
                  'C',
                  style: AppText.display.copyWith(
                    color: Colors.white,
                    fontSize: 96,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'The trusted network for\nhealthcare professionals',
                textAlign: TextAlign.center,
                style: AppText.display.copyWith(fontSize: 26, height: 1.3),
              ),
              const SizedBox(height: 12),
              Text(
                'Connect with verified peers, share clinical insights, '
                'and grow your career in a secure environment.',
                textAlign: TextAlign.center,
                style: AppText.body.copyWith(color: AppColors.textTertiary),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('get-started-button'),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignupRoleSelectScreen()),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
                child: Text('Log In', style: AppText.label.copyWith(color: AppColors.accentFill)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
