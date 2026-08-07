import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/step_indicator.dart';
import '../../widgets/main_shell.dart';

class CredentialVerificationScreen extends StatelessWidget {
  const CredentialVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Sign Up'), leading: const BackButton()),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepIndicator(step: 2),
              const SizedBox(height: 20),
              Text('Verify your credentials', style: AppText.title),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'License number')),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'State / licensing board')),
              const SizedBox(height: 16),
              const TextField(decoration: InputDecoration(labelText: 'NPI number')),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  border: Border.all(color: AppColors.border, style: BorderStyle.solid),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.upload_file, color: AppColors.accentFill, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      'Upload your license photo or PDF',
                      textAlign: TextAlign.center,
                      style: AppText.label.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Reviewed within 1-2 business days',
                style: AppText.caption,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('submit-verification-button'),
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainShell()),
                    (route) => false,
                  ),
                  child: const Text('Submit for Review'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
