import 'package:flutter/material.dart';
import '../../models/mock_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/avatar.dart';

class ChatThreadScreen extends StatelessWidget {
  final Professional peer;
  const ChatThreadScreen({super.key, required this.peer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        titleSpacing: 0,
        title: Row(
          children: [
            MockAvatar(seed: peer.avatarSeed, name: peer.name, size: 36, verified: true),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(peer.name, style: AppText.label),
                Text(peer.specialty, style: AppText.caption),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                key: const Key('chat-messages-list'),
                padding: const EdgeInsets.all(16),
                children: mockChatMessages.map((m) => _Bubble(message: m)).toList(),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.attach_file, color: AppColors.textTertiary), onPressed: () {}),
                    Expanded(
                      child: TextField(
                        key: const Key('chat-input-field'),
                        decoration: InputDecoration(
                          hintText: 'Message...',
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
                        key: const Key('chat-send-button'),
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

class _Bubble extends StatelessWidget {
  final ChatMessage message;
  const _Bubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: message.isMe ? AppColors.accentFill : AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(AppRadius.control),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: AppText.body.copyWith(color: message.isMe ? Colors.white : AppColors.textPrimary),
            ),
            const SizedBox(height: 4),
            Text(
              message.time,
              style: AppText.caption.copyWith(
                color: message.isMe ? Colors.white70 : AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
