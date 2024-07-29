import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final widgetKey = constraints.crossAxisExtent <= Breakpoints.mobile
            ? const Key('__CasesView_list_key__')
            : const Key('__CasesView_grid_key__');

        final crossAxisCount =
            constraints.crossAxisExtent <= Breakpoints.mobile ? 1 : 2;

        return SliverAlignedGrid.count(
          key: widgetKey,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: AppSpacing.xs,
          crossAxisSpacing: AppSpacing.xs,
          itemCount: caseModels.length,
          itemBuilder: (BuildContext context, int index) {
            final caseModel = caseModels[index];
            return CasesListItem(
              key: Key(
                '__cases_list_item_${caseModel.caseID}_key__',
              ),
              caseModel: caseModel,
              caseTileStyle: caseTileStyle,
            );
          },
        );
      },
    );

    // return SliverList(
    //   //key: ValueKey(cases.hashCode),
    //   delegate: SliverChildBuilderDelegate(childCount: caseModels.length,
    //       (context, index) {
    //     final caseModel = caseModels[index];
    //     return CasesListItem(
    //       key: Key(
    //         '__cases_list_item_${caseModel.caseID}_key__',
    //       ),
    //       caseModel: caseModel,
    //       caseTileStyle: caseTileStyle,
    //     );
    //   }),
    // );
  }
}
