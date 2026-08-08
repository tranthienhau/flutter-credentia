import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';
import '../messages/chat_thread_screen.dart';

class ProfessionalProfileScreen extends StatelessWidget {
  final Professional professional;
  const ProfessionalProfileScreen({super.key, required this.professional});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: IconButton(
                key: const Key('professional-profile-back-button'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              decoration: BoxDecoration(gradient: AppColors.gradient, borderRadius: BorderRadius.circular(AppRadius.card)),
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
                      child: MockAvatar(seed: professional.avatarSeed, name: professional.name, size: 88, verified: true),
                    ),
                    const SizedBox(height: 8),
                    Text(professional.name, style: AppText.display.copyWith(fontSize: 24)),
                    Text(professional.specialty, style: AppText.body.copyWith(color: AppColors.textSecondary)),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textTertiary),
                        Text(professional.city, style: AppText.caption),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (professional.bio.isNotEmpty) Text(professional.bio, style: AppText.body),
                    const SizedBox(height: 16),
                    AppCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Stat(value: '${professional.connections}', label: 'Connections'),
                          _Stat(value: '${professional.yearsExperience}', label: 'Years exp.'),
                          _Stat(value: '${professional.rating}', label: 'Rating'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            key: const Key('profile-connect-button'),
                            onPressed: () {},
                            child: const Text('Connect'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            key: const Key('profile-message-button'),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => ChatThreadScreen(peer: professional)),
                            ),
                            child: const Text('Message'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('Recent reviews', style: AppText.title),
                    const SizedBox(height: 12),
                    ...mockReviews.map((r) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: AppCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(r.reviewerName, style: AppText.label),
                                    const Spacer(),
                                    const Icon(Icons.star, size: 14, color: AppColors.accent),
                                    Text(' ${r.rating}', style: AppText.caption),
                                  ],
                                ),
                                const SizedBox(height: 6),
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
