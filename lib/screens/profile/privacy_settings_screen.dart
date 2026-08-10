import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';

class PrivacySettingsScreen extends StatefulWidget {
  const PrivacySettingsScreen({super.key});

  @override
  State<PrivacySettingsScreen> createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _locationVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Privacy & Visibility'), leading: const BackButton()),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _Row(label: 'Profile visibility', value: 'Public'),
                  const Divider(height: 1, color: AppColors.border),
                  _Row(label: 'Default post visibility', value: 'Connections only'),
                  const Divider(height: 1, color: AppColors.border),
                  _Row(label: 'Who can message me', value: 'Connections'),
                  const Divider(height: 1, color: AppColors.border),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Expanded(child: Text('Who can see my location', style: AppText.label)),
                        Switch(
                          key: const Key('location-visibility-switch'),
                          value: _locationVisible,
                          activeThumbColor: AppColors.accent,
                          onChanged: (v) => setState(() => _locationVisible = v),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: AppColors.border),
                  _Row(label: 'Blocked users', value: ''),
                ],
              ),
            ),
            const SizedBox(height: 16),
            AppCard(
              padding: EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(Icons.shield_outlined, color: AppColors.accentFill),
                title: Text('Data & Privacy Policy', style: AppText.label),
                trailing: const Icon(Icons.open_in_new, size: 18, color: AppColors.textTertiary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppText.label)),
          if (value.isNotEmpty) Text(value, style: AppText.body.copyWith(color: AppColors.textSecondary)),
          const Icon(Icons.chevron_right, color: AppColors.textTertiary),
        ],
      ),
    );
  }
}
