import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router.dart';
import '../cases.dart';

class CasesPage extends ConsumerWidget with CasesEventMixin, CasesStateMixin {
  const CasesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CasesPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CasesScreen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(casesNotifierProvider.notifier).clearCases();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: const CasesView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        ref.read(casesNotifierProvider.notifier).scrollController,
        key: const Key('__cases_screen_fab_key__'),
        title: S.of(context).addCase,
        onTap: () {
          AddCaseRoute(CaseModelX.zero(), newRecord: true).push<void>(context);
        },
      ),
    );
  }
}
