import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/avatar.dart';
import 'report_content_screen.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;
  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Post'),
        leading: const BackButton(),
        actions: [
          IconButton(
            key: const Key('post-detail-more-button'),
            icon: const Icon(Icons.more_horiz),
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const ReportContentScreen(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
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
                            Text('${post.author.specialty} · ${post.timeAgo}', style: AppText.caption),
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
                      height: 180,
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
                    ],
                  ),
                  const Divider(height: 32, color: AppColors.border),
                  Text('Comments (${mockComments.length})', style: AppText.title),
                  const SizedBox(height: 12),
                  ...mockComments.map((c) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MockAvatar(seed: c.author, name: c.author, size: 36),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(c.author, style: AppText.label),
                                      const SizedBox(width: 6),
                                      Text(c.timeAgo, style: AppText.caption),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(c.text, style: AppText.body),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          fillColor: AppColors.surfaceAlt,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      backgroundColor: AppColors.accentFill,
                      child: IconButton(
                        icon: const Icon(Icons.send, color: Colors.white, size: 18),
                        onPressed: () {},
                      ),
                    ),
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
