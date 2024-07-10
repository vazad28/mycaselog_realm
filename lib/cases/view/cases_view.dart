import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesView extends ConsumerWidget {
  const CasesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = ref.watch(caseTileStyleProvider);
    final cases = ref.watch(casesProvider);

    return StreamBuilder(
      stream: cases.changes,
      builder: (context, snapshot) => SliverList(
        //key: ValueKey(cases.hashCode),
        delegate: SliverChildBuilderDelegate(childCount: cases.length,
            (context, index) {
          final caseModel = cases.elementAt(index);
          final mediaModels =
              ref.watch(casesProvider.notifier).getCaseMedia(caseModel.caseID);

          final hybridCaseModel = HybridCaseModel(
            caseModel: caseModel,
            mediaModels: mediaModels,
          );

          return CasesListItem(
            key: Key(
              '__cases_list_item_${hybridCaseModel.caseModel.caseID}_key__',
            ),
            hybridCaseModel: hybridCaseModel,
            caseTileStyle: caseTileStyle,
          );
        }),
      ),
    );
  }
}
