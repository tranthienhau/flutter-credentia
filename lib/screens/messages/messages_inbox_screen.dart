import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/avatar.dart';
import 'chat_thread_screen.dart';

class MessagesInboxScreen extends ConsumerWidget {
  const MessagesInboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversations = ref.watch(conversationsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Messages')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search messages',
                  prefixIcon: Icon(Icons.search, color: AppColors.textTertiary),
                ),
              ),
            ),
            Expanded(
              child: conversations.isEmpty
                  ? const _EmptyMessages()
                  : ListView.separated(
                      key: const Key('conversations-list'),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                      itemCount: conversations.length,
                      separatorBuilder: (_, __) => const Divider(color: AppColors.border, height: 24),
                      itemBuilder: (_, i) {
                        final c = conversations[i];
                        return _ConversationTile(conversation: c);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyMessages extends ConsumerWidget {
  const _EmptyMessages();

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
              child: const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),
            Text('No messages yet', style: AppText.title, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Start a conversation with a connection',
              textAlign: TextAlign.center,
              style: AppText.body.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ref.read(bottomNavIndexProvider.notifier).state = 1,
              child: const Text('Find Professionals'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConversationTile extends StatelessWidget {
  final Conversation conversation;
  const _ConversationTile({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ChatThreadScreen(peer: conversation.peer)),
      ),
      child: Row(
        children: [
          MockAvatar(seed: conversation.peer.avatarSeed, name: conversation.peer.name, verified: true),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(conversation.peer.name, style: AppText.label),
                Text(
                  conversation.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.body.copyWith(color: AppColors.textTertiary),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(conversation.timeAgo, style: AppText.caption),
              if (conversation.unread)
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
