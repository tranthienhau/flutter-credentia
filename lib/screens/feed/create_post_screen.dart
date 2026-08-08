import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final visibility = ref.watch(postVisibilityProvider);
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.card)),
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2))),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                  Expanded(child: Text('New Post', style: AppText.title, textAlign: TextAlign.center)),
                  TextButton(
                    key: const Key('submit-post-button'),
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        ref.read(feedPostsProvider.notifier).state = [
                          Post(
                            id: 'new-${DateTime.now().millisecondsSinceEpoch}',
                            author: currentUser,
                            text: _controller.text.trim(),
                            timeAgo: 'Just now',
                            visibility: visibility,
                          ),
                          ...ref.read(feedPostsProvider),
                        ];
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('Post', style: AppText.label.copyWith(color: AppColors.accentFill)),
                  ),
                ],
              ),
              Row(
                children: [
                  const MockAvatar(seed: 'sarah-jenkins', name: 'Dr. Sarah Jenkins', size: 40, verified: true),
                  const SizedBox(width: 10),
                  Text('Dr. Sarah Jenkins', style: AppText.label),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                key: const Key('post-composer-field'),
                controller: _controller,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Share an update with your network...',
                  border: InputBorder.none,
                  filled: false,
                ),
              ),
              const SizedBox(height: 12),
              Text('Who can see this?', style: AppText.label.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  AppChip(
                    label: 'Public',
                    selected: visibility == PostVisibility.public,
                    onTap: () => ref.read(postVisibilityProvider.notifier).state = PostVisibility.public,
                  ),
                  AppChip(
                    label: 'Connections only',
                    selected: visibility == PostVisibility.connections,
                    onTap: () => ref.read(postVisibilityProvider.notifier).state = PostVisibility.connections,
                  ),
                  AppChip(
                    label: 'Private',
                    selected: visibility == PostVisibility.private,
                    onTap: () => ref.read(postVisibilityProvider.notifier).state = PostVisibility.private,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(icon: const Icon(Icons.photo_camera_outlined, color: AppColors.accentFill), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.attach_file, color: AppColors.accentFill), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
