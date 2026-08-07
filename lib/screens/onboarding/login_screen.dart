import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/main_shell.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Text('Credentia', style: AppText.display.copyWith(color: AppColors.accentFill)),
              ),
              const SizedBox(height: 40),
              Text('Welcome Back', style: AppText.title, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                'Log in to access your professional network.',
                textAlign: TextAlign.center,
                style: AppText.body.copyWith(color: AppColors.textTertiary),
              ),
              const SizedBox(height: 32),
              const TextField(
                key: Key('login-email-field'),
                decoration: InputDecoration(labelText: 'Email address'),
              ),
              const SizedBox(height: 16),
              const TextField(
                key: Key('login-password-field'),
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?', style: AppText.label.copyWith(color: AppColors.accentFill)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                key: const Key('login-button'),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const MainShell()),
                  (route) => false,
                ),
                child: const Text('Log In'),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.border)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('or continue with', style: AppText.caption),
                  ),
                  const Expanded(child: Divider(color: AppColors.border)),
                ],
              ),
              const SizedBox(height: 24),
              OutlinedButton(onPressed: () {}, child: const Text('Google')),
              const SizedBox(height: 12),
              OutlinedButton(onPressed: () {}, child: const Text('Apple')),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: AppText.body.copyWith(color: AppColors.textTertiary),
                    children: [
                      const TextSpan(text: 'New here? '),
                      TextSpan(
                        text: 'Create an account',
                        style: AppText.label.copyWith(color: AppColors.accentFill),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
