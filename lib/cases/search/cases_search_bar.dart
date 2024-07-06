import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';
import 'cases_search_view.dart';

class CasesSearchBar extends ConsumerWidget with CasesEventMixin {
  const CasesSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      primary: false,
      pinned: true,
      expandedHeight: kToolbarHeight + AppSpacing.sm,
      collapsedHeight: kToolbarHeight + AppSpacing.sm,
      scrolledUnderElevation: 0.5,
      shadowColor: context.colorScheme.shadow.lighter(),
      surfaceTintColor: context.colorScheme.surface,
      titleSpacing: AppSpacing.md,
      title: const CasesSearchView(
        anchorStyle: CasesSearchBarStyle.bar,
      ),
      actions: const [
        CaseTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}

class _CasesCountWidget extends ConsumerWidget with CasesStateMixin {
  const _CasesCountWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = watchTotalCasesCount(ref);
    return counter.when(
      data: (data) => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.sm),
        child: Text(
          data.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      loading: () => const Spinner(),
      error: (err, _) {
        return const Icon(Icons.error);
      },
    );
  }
}
