import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm_dart/src/results.dart';

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
        // return ListTile(
        //   title: Text(caseModel.title ?? 'No title'),
        //   onTap: () {
        //     context.showInfoDialog(caseModel.mediaModels.toString());
        //   },
        //   onLongPress: () {
        //     ref.read(dbProvider).conversationCollection.addMediaModel();
        //   },
        // );
      }),
    );
  }
}
