part of 'stats_search_bar.dart';

class StatsSearchPhrasesList extends ConsumerWidget with StatsMixin {
  const StatsSearchPhrasesList({required this.searchController, super.key});

  final SearchController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartReqModel = ref.watch(statsNotifierProvider);

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      itemCount: StatsSearchPhrases.items.length,
      itemBuilder: (_, index) {
        final e = StatsSearchPhrases.items[index];
        return MaterialCard.outlined(
          borderColor: chartReqModel.filterClause == e.params
              ? Theme.of(context).colorScheme.outline
              : Colors.transparent,
          padding: EdgeInsets.zero,
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity.standard,
            contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            title: Text(
              e.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              e.params,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: chartReqModel.filterClause == e.params
                ? const Icon(
                    Icons.check,
                    size: 24,
                  )
                : null,
            onTap: () {
              searchController.value = TextEditingValue(text: e.title);
              searchStats(ref, null, e.params);
              searchController.closeView(e.title);
            },
          ),
        );
      },
    );
  }
}
