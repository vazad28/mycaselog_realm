import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../cases.dart';

class CasesView extends ConsumerWidget {
  const CasesView({
    required this.caseModels,
    super.key,
  });

  final RealmResults<CaseModel> caseModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = ref.watch(caseTileStyleProvider);

    return SliverList(
      //key: ValueKey(cases.hashCode),
      delegate: SliverChildBuilderDelegate(childCount: caseModels.length,
          (context, index) {
        final caseModel = caseModels[index];
        return CasesListItem(
          key: Key(
            '__cases_list_item_${caseModel.caseID}_key__',
          ),
          caseModel: caseModel,
          caseTileStyle: caseTileStyle,
        );
      }),
    );
  }
}
