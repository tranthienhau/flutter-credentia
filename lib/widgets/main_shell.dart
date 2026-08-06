import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import '../screens/feed/feed_home_screen.dart';
import '../screens/discover/discover_search_screen.dart';
import '../screens/messages/messages_inbox_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/profile/my_profile_screen.dart';
import '../theme/app_theme.dart';

class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  static const _tabs = [
    _TabDef('Feed', Icons.home_outlined, Icons.home),
    _TabDef('Discover', Icons.search_outlined, Icons.search),
    _TabDef('Messages', Icons.chat_bubble_outline, Icons.chat_bubble),
    _TabDef('Notifications', Icons.notifications_none, Icons.notifications),
    _TabDef('Profile', Icons.person_outline, Icons.person),
  ];

  static const _screens = [
    FeedHomeScreen(),
    DiscoverSearchScreen(),
    MessagesInboxScreen(),
    NotificationsScreen(),
    MyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);
    return Scaffold(
      body: IndexedStack(index: index, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(top: BorderSide(color: AppColors.border, width: 1)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_tabs.length, (i) {
              final tab = _tabs[i];
              final active = i == index;
              return GestureDetector(
                key: Key('nav-tab-${tab.label.toLowerCase()}'),
                onTap: () => ref.read(bottomNavIndexProvider.notifier).state = i,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        active ? tab.activeIcon : tab.icon,
                        color: active ? AppColors.accent : AppColors.textTertiary,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        tab.label,
                        style: AppText.caption.copyWith(
                          color: active ? AppColors.accent : AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _TabDef {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  const _TabDef(this.label, this.icon, this.activeIcon);
}
