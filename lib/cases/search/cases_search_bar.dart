import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../search/search.dart';
import '../cases.dart';

class CasesSearchBar extends ConsumerWidget with SearchMixin {
  const CasesSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      primary: false,
      pinned: true,
      expandedHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      scrolledUnderElevation: 0.5,
      shadowColor: context.colorScheme.shadow.lighter(),
      surfaceTintColor: context.colorScheme.surface,
      titleSpacing: AppSpacing.md,
      title: SearchView<CaseModel>(
        anchorStyle: SearchBarStyle.bar,
        onSearch: (searchTerm) => searchCases(ref, searchTerm),
      ),
      actions: const [
        CaseTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
