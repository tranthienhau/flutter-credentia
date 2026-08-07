import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/step_indicator.dart';
import 'credential_verification_screen.dart';

const _roles = [
  'Dentist',
  'Dental Hygienist',
  'Dental Assistant',
  'Orthodontist',
  'More specialties',
];

class SignupRoleSelectScreen extends ConsumerWidget {
  const SignupRoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(onboardingRoleProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Sign Up'), leading: const BackButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepIndicator(step: 1),
              const SizedBox(height: 20),
              Text("What's your role?", style: AppText.title),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.6,
                children: _roles.map((r) {
                  final selected = role == r;
                  return GestureDetector(
                    key: Key('role-${r.toLowerCase().replaceAll(' ', '-')}'),
                    onTap: () => ref.read(onboardingRoleProvider.notifier).state = r,
                    child: Container(
                      decoration: BoxDecoration(
                        color: selected ? AppColors.accentTint : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadius.card),
                        border: Border.all(
                          color: selected ? AppColors.accent : AppColors.border,
                          width: selected ? 2 : 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        r,
                        textAlign: TextAlign.center,
                        style: AppText.label.copyWith(
                          color: selected ? AppColors.accentFill : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              TextField(
                key: const Key('signup-email-field'),
                decoration: const InputDecoration(labelText: 'Email address'),
              ),
              const SizedBox(height: 16),
              TextField(
                key: const Key('signup-password-field'),
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('signup-continue-button'),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CredentialVerificationScreen()),
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
