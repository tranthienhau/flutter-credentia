import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.dart';
import '../../providers/app_providers.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_card.dart';
import '../../widgets/avatar.dart';
import 'professional_profile_screen.dart';

class DiscoverSearchScreen extends ConsumerWidget {
  const DiscoverSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(searchResultsProvider);
    final query = ref.watch(searchQueryProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: TextField(
                key: const Key('discover-search-field'),
                onChanged: (v) => ref.read(searchQueryProvider.notifier).state = v,
                decoration: InputDecoration(
                  hintText: 'Search professionals, specialties, cities',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
                  suffixIcon: const Icon(Icons.tune, color: AppColors.textTertiary),
                  fillColor: AppColors.surface,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    AppChip(label: 'Specialty'),
                    SizedBox(width: 8),
                    AppChip(label: 'Location'),
                    SizedBox(width: 8),
                    AppChip(label: 'Rating'),
                    SizedBox(width: 8),
                    AppChip(label: 'Verified only'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: results.isEmpty
                  ? _EmptyResults(query: query, ref: ref)
                  : ListView.separated(
                      key: const Key('discover-results-list'),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                      itemCount: results.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) => _ProfessionalCard(professional: results[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  final String query;
  final WidgetRef ref;
  const _EmptyResults({required this.query, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(color: AppColors.surfaceAlt, shape: BoxShape.circle),
              child: const Icon(Icons.search_off, color: AppColors.textTertiary, size: 40),
            ),
            const SizedBox(height: 20),
            Text('No professionals found', style: AppText.title, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your filters or search a different specialty',
              textAlign: TextAlign.center,
              style: AppText.body.copyWith(color: AppColors.textTertiary),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              key: const Key('clear-filters-button'),
              onPressed: () => ref.read(searchQueryProvider.notifier).state = '',
              child: const Text('Clear filters'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfessionalCard extends StatelessWidget {
  final Professional professional;
  const _ProfessionalCard({required this.professional});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ProfessionalProfileScreen(professional: professional)),
      ),
      child: Row(
        children: [
          MockAvatar(seed: professional.avatarSeed, name: professional.name, size: 52, verified: professional.verified),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(professional.name, style: AppText.label),
                Text(professional.specialty, style: AppText.caption),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 13, color: AppColors.textTertiary),
                    Text(professional.city, style: AppText.caption),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, size: 13, color: AppColors.accent),
                    Text(' ${professional.rating}', style: AppText.caption),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            key: Key('connect-${professional.id}'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(minimumSize: const Size(90, 36), backgroundColor: AppColors.accentFill, foregroundColor: Colors.white, side: BorderSide.none),
            child: const Text('Connect'),
          ),
        ],
      ),
    );
  }
}
