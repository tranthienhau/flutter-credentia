import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _tab = 0;
  late List<VerificationRequest> _requests;

  @override
  void initState() {
    super.initState();
    _requests = List.of(mockVerificationRequests);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Admin'), leading: const BackButton()),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Expanded(child: _StatCard(label: 'Pending verifications', value: '${_requests.length}')),
                const SizedBox(width: 12),
                const Expanded(child: _StatCard(label: 'Open reports', value: '5')),
                const SizedBox(width: 12),
                const Expanded(child: _StatCard(label: 'Active users', value: '1.2k')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _SegTab(label: 'Verification requests', active: _tab == 0, onTap: () => setState(() => _tab = 0)),
                ),
                Expanded(
                  child: _SegTab(label: 'Reported content', active: _tab == 1, onTap: () => setState(() => _tab = 1)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_tab == 0)
              if (_requests.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: Text('No pending verifications', style: AppText.body.copyWith(color: AppColors.textTertiary))),
                )
              else
                ..._requests.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AppCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MockAvatar(seed: r.applicant.avatarSeed, name: r.applicant.name, size: 40),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(r.applicant.name, style: AppText.label),
                                      Text(r.applicant.specialty, style: AppText.caption),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(color: AppColors.surfaceAlt, borderRadius: BorderRadius.circular(AppRadius.control)),
                              child: Row(
                                children: [
                                  const Icon(Icons.description_outlined, size: 16, color: AppColors.textTertiary),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(r.licenseDoc, style: AppText.caption)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    key: Key('reject-${r.applicant.id}'),
                                    onPressed: () => setState(() => _requests.remove(r)),
                                    child: const Text('Reject'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    key: Key('approve-${r.applicant.id}'),
                                    onPressed: () => setState(() => _requests.remove(r)),
                                    child: const Text('Approve'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(child: Text('5 reports awaiting review', style: AppText.body.copyWith(color: AppColors.textTertiary))),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppText.display.copyWith(fontSize: 22)),
          const SizedBox(height: 4),
          Text(label, style: AppText.caption),
        ],
      ),
    );
  }
}

class _SegTab extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _SegTab({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: active ? AppColors.accentFill : AppColors.border, width: 2)),
        ),
        alignment: Alignment.center,
        child: Text(label, style: AppText.label.copyWith(color: active ? AppColors.accentFill : AppColors.textTertiary)),
      ),
    );
  }
}
