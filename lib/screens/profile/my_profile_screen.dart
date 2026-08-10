import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';
import 'edit_profile_screen.dart';
import 'privacy_settings_screen.dart';
import '../admin/admin_dashboard_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  int _tab = 0;
  static const _tabs = ['Posts', 'Credentials', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              height: 110,
              decoration: BoxDecoration(gradient: AppColors.gradient, borderRadius: BorderRadius.circular(AppRadius.card)),
            ),
            Transform.translate(
              offset: const Offset(0, -36),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
                          child: const MockAvatar(seed: 'sarah-jenkins', name: 'Dr. Sarah Jenkins', size: 84, verified: true),
                        ),
                        const Spacer(),
                        IconButton(
                          key: const Key('profile-admin-button'),
                          icon: const Icon(Icons.shield_outlined),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const AdminDashboardScreen()),
                          ),
                        ),
                        IconButton(
                          key: const Key('profile-settings-button'),
                          icon: const Icon(Icons.settings_outlined),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const PrivacySettingsScreen()),
                          ),
                        ),
                      ],
                    ),
                    Text(currentUser.name, style: AppText.display.copyWith(fontSize: 24)),
                    Text(currentUser.specialty, style: AppText.body.copyWith(color: AppColors.textSecondary)),
                    const SizedBox(height: 12),
                    AppCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Stat(value: '${currentUser.connections}', label: 'Connections'),
                          const _Stat(value: '27', label: 'Posts'),
                          _Stat(value: '${currentUser.rating}', label: 'Rating'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        key: const Key('edit-profile-button'),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(_tabs.length, (i) {
                        final active = i == _tab;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _tab = i),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: active ? AppColors.accentFill : AppColors.border, width: 2),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _tabs[i],
                                style: AppText.label.copyWith(color: active ? AppColors.accentFill : AppColors.textTertiary),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    if (_tab == 0)
                      ...mockPosts.take(2).map((p) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: AppCard(
                              child: Text(p.text, maxLines: 3, overflow: TextOverflow.ellipsis, style: AppText.body),
                            ),
                          ))
                    else if (_tab == 1)
                      AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [const Icon(Icons.verified, color: AppColors.accentFill, size: 18), const SizedBox(width: 8), Text('Illinois State Dental Board', style: AppText.label)]),
                            const SizedBox(height: 8),
                            Text('License #IL-DDS-48213 · Verified 2026', style: AppText.caption),
                          ],
                        ),
                      )
                    else
                      ...mockReviews.map((r) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: AppCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(r.reviewerName, style: AppText.label),
                                  const SizedBox(height: 4),
                                  Text(r.comment, style: AppText.body),
                                ],
                              ),
                            ),
                          )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppText.title),
        Text(label, style: AppText.caption),
      ],
    );
  }
}
