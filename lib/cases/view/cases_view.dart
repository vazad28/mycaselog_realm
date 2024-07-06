import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesView extends ConsumerWidget with CasesEventMixin, CasesStateMixin {
  const CasesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = watchCaseTileStyle(ref);
    final cases = ref.watch(casesNotifierProvider);
    //final cases = ref.watch(realmProvider).all<CaseModel>();

    final sliverList = SliverList(
      delegate: SliverChildBuilderDelegate(childCount: cases.length,
          (context, index) {
        final caseModel = cases.elementAt(index);
        final mediaModels = ref
            .watch(casesNotifierProvider.notifier)
            .getCaseMedia(caseModel.caseID);

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
    );

    return StreamBuilder(
      stream: cases.changes,
      builder: (context, snapshot) => sliverList,
    );
  }
}
