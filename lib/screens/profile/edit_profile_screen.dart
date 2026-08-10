import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/avatar.dart';

enum FieldVisibility { public, connections, private }

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  FieldVisibility _phoneVis = FieldVisibility.connections;
  FieldVisibility _licenseVis = FieldVisibility.public;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        leading: const BackButton(),
        actions: [
          TextButton(
            key: const Key('save-profile-button'),
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Save', style: AppText.label.copyWith(color: AppColors.accentFill)),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Stack(
                children: [
                  const MockAvatar(seed: 'sarah-jenkins', name: 'Dr. Sarah Jenkins', size: 88, verified: true),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(color: AppColors.accentFill, shape: BoxShape.circle),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              initialValue: currentUser.name,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: currentUser.specialty,
              decoration: const InputDecoration(labelText: 'Specialty'),
              items: const ['Periodontist', 'Dentist', 'Orthodontist', 'Oral Surgeon']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: currentUser.bio,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            const SizedBox(height: 20),
            Text('License info', style: AppText.title),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(AppRadius.control),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lock_outline, size: 16, color: AppColors.textTertiary),
                  const SizedBox(width: 8),
                  Text('License #IL-DDS-48213 (verified)', style: AppText.body.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _VisibilityRow(
              label: 'Phone number',
              value: _phoneVis,
              onChanged: (v) => setState(() => _phoneVis = v),
            ),
            const SizedBox(height: 16),
            _VisibilityRow(
              label: 'License number',
              value: _licenseVis,
              onChanged: (v) => setState(() => _licenseVis = v),
            ),
          ],
        ),
      ),
    );
  }
}

class _VisibilityRow extends StatelessWidget {
  final String label;
  final FieldVisibility value;
  final ValueChanged<FieldVisibility> onChanged;
  const _VisibilityRow({required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppText.label),
        const SizedBox(height: 6),
        SegmentedButton<FieldVisibility>(
          segments: const [
            ButtonSegment(value: FieldVisibility.public, label: Text('Public')),
            ButtonSegment(value: FieldVisibility.connections, label: Text('Connections')),
            ButtonSegment(value: FieldVisibility.private, label: Text('Private')),
          ],
          selected: {value},
          onSelectionChanged: (s) => onChanged(s.first),
        ),
      ],
    );
  }
}
