import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesViewList extends ConsumerWidget {
  const CasesViewList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = ref.watch(caseTileStyleProvider);
    final cases = ref.watch(casesProvider);

    return StreamBuilder(
      stream: cases.changes,
      builder: (context, snapshot) => ListView.builder(
        itemCount: cases.length,
        itemBuilder: (_, index) {
          final caseModel = cases.elementAt(index);
          final mediaModels =
              ref.watch(casesProvider.notifier).getCaseMedia(caseModel.caseID);

          final hybridCaseModel = HybridCaseModel(
            caseModel: caseModel,
            mediaModels: mediaModels,
          );

          return CasesListItem(
            key: ValueKey(hybridCaseModel.caseModel.caseID),
            hybridCaseModel: hybridCaseModel,
            caseTileStyle: caseTileStyle,
          );
        },
      ),
    );
  }
}
