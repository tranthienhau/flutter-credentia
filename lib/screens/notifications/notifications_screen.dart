import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';

IconData _iconFor(NotificationType t) {
  switch (t) {
    case NotificationType.connection:
      return Icons.person_add_outlined;
    case NotificationType.comment:
      return Icons.mode_comment_outlined;
    case NotificationType.like:
      return Icons.favorite_border;
    case NotificationType.verification:
      return Icons.verified_outlined;
    case NotificationType.admin:
      return Icons.shield_outlined;
  }
}

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsProvider);
    final today = notifications.take(2).toList();
    final week = notifications.skip(2).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            key: const Key('mark-all-read-button'),
            onPressed: () => ref.read(notificationsProvider.notifier).state = notifications
                .map((n) => AppNotification(type: n.type, text: n.text, timeAgo: n.timeAgo, unread: false))
                .toList(),
            child: Text('Mark all read', style: AppText.label.copyWith(color: AppColors.accentFill)),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          key: const Key('notifications-list'),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
          children: [
            if (today.isNotEmpty) ...[
              Text('Today', style: AppText.label.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              ...today.map((n) => _NotificationTile(n: n)),
              const SizedBox(height: 16),
            ],
            if (week.isNotEmpty) ...[
              Text('This week', style: AppText.label.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              ...week.map((n) => _NotificationTile(n: n)),
            ],
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final AppNotification n;
  const _NotificationTile({required this.n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(color: AppColors.accentTint, shape: BoxShape.circle),
            child: Icon(_iconFor(n.type), size: 18, color: AppColors.accentFill),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(n.text, style: AppText.body)),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(n.timeAgo, style: AppText.caption),
              if (n.unread)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: AppColors.accentFill, shape: BoxShape.circle),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
