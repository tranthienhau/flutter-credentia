import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../models/mock_data.dart';

final feedPostsProvider = StateProvider<List<Post>>((ref) => List.of(mockPosts));

final feedHasPostsProvider = Provider<bool>((ref) => ref.watch(feedPostsProvider).isNotEmpty);

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = Provider<List<Professional>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  if (query.isEmpty) return mockProfessionals;
  return mockProfessionals
      .where((p) =>
          p.name.toLowerCase().contains(query) ||
          p.specialty.toLowerCase().contains(query))
      .toList();
});

final conversationsProvider = StateProvider<List<Conversation>>(
  (ref) => List.of(mockConversations),
);

final notificationsProvider = StateProvider<List<AppNotification>>(
  (ref) => List.of(mockNotifications),
);

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final onboardingRoleProvider = StateProvider<String?>((ref) => null);

final postVisibilityProvider = StateProvider<PostVisibility>((ref) => PostVisibility.public);
