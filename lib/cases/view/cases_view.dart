import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/realm/realm_config.dart';
import '../../router/router.dart';
import '../cases.dart';

class CasesView extends ConsumerWidget with CasesEventMixin, CasesStateMixin {
  const CasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final realm = ref.watch(realmProvider);
    final cases = realm.all<CaseModel>();
    final scrollController =
        ref.read(casesNotifierProvider.notifier).scrollController;

    return StreamBuilder(
        stream: cases.changes,
        builder: (context, snapshot) {
          return Scrollbar(
            controller: scrollController,
            child: ListView.builder(
              controller: scrollController,
              itemExtent: 96,
              itemCount: cases.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cases[index];
                return ListTile(
                  title: Text('Item ${item.caseID}'),
                  onTap: () =>
                      AddCaseRoute(item, newRecord: false).push<void>(context),
                );
              },
            ),
          );
        });

    // return ListView.builder(
    //     itemCount: cases.length,
    //     itemBuilder: (_, index) {
    //       return ListTile(
    //         title: Text(cases.elementAt(index).caseID),
    //       );
    //     });
  }
}
