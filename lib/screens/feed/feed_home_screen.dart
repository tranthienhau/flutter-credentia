import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';
import 'create_post_screen.dart';
import 'post_detail_screen.dart';

class FeedHomeScreen extends ConsumerWidget {
  const FeedHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(feedPostsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Credentia', style: AppText.display.copyWith(color: AppColors.accentFill, fontSize: 26)),
                      const Icon(Icons.notifications_none, color: AppColors.textPrimary),
                    ],
                  ),
                ),
                if (posts.isEmpty)
                  const Expanded(child: _EmptyFeed())
                else
                  Expanded(
                    child: ListView(
                      key: const Key('feed-list'),
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                      children: [
                        SizedBox(
                          height: 78,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: mockProfessionals.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (_, i) {
                              final p = mockProfessionals[i];
                              return Column(
                                children: [
                                  MockAvatar(seed: p.avatarSeed, name: p.name, size: 52, verified: true),
                                  const SizedBox(height: 4),
                                  Text(p.name.split(' ').last, style: AppText.caption),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...posts.map((p) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _PostCard(post: p),
                            )),
                      ],
                    ),
                  ),
              ],
            ),
            Positioned(
              right: 8,
              bottom: 16,
              child: FloatingActionButton(
                key: const Key('create-post-fab'),
                backgroundColor: AppColors.accentFill,
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const CreatePostScreen(),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFeed extends ConsumerWidget {
  const _EmptyFeed();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(gradient: AppColors.gradient, shape: BoxShape.circle),
              child: const Icon(Icons.dynamic_feed, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),
            Text('Your feed is quiet', style: AppText.title, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Connect with peers or share your first update to see posts here',
              textAlign: TextAlign.center,
              style: AppText.body.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('empty-feed-find-professionals'),
              onPressed: () => ref.read(bottomNavIndexProvider.notifier).state = 1,
              child: const Text('Find Professionals'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;
  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => PostDetailScreen(post: post)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MockAvatar(seed: post.author.avatarSeed, name: post.author.name, verified: true),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.author.name, style: AppText.label),
                    Row(
                      children: [
                        Text(post.author.specialty, style: AppText.caption),
                        const Text(' · ', style: TextStyle(color: AppColors.textTertiary)),
                        Text(post.timeAgo, style: AppText.caption),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(post.text, style: AppText.body),
          if (post.hasImage) ...[
            const SizedBox(height: 12),
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: AppColors.gradient,
                borderRadius: BorderRadius.circular(AppRadius.control),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.image_outlined, color: Colors.white, size: 32),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 18, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text('${post.likes}', style: AppText.caption),
              const SizedBox(width: 20),
              const Icon(Icons.mode_comment_outlined, size: 18, color: AppColors.textTertiary),
              const SizedBox(width: 4),
              Text('${post.comments}', style: AppText.caption),
              const Spacer(),
              const Icon(Icons.share_outlined, size: 18, color: AppColors.textTertiary),
            ],
          ),
        ],
      ),
    );
  }
}
