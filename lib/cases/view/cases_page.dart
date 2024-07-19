import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/providers/providers.dart';
import '../../router/routes/routes.dart';
import '../cases.dart';

class CasesPage extends ConsumerStatefulWidget {
  const CasesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CasesPageState();
}

class _CasesPageState extends ConsumerState<CasesPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(collectionsProvider).casesCollection.getAll();

    return Scaffold(
      key: const Key('__cases_screen_scaffold_key__'),
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        surfaceTintColor: context.colorScheme.surfaceTint,
      ),
      body: StreamBuilder<RealmResultsChanges<CaseModel>>(
        stream: data.changes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final caseModels = snapshot.data!.results;
            // Rebuild your widget based on casesList
            return CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                const CasesAppBar(),
                const CasesSearchBar(),
                CasesView(caseModels: caseModels),
              ],
            );
          } else if (snapshot.hasError) {
            // Handle errors
            return Text('Error: ${snapshot.error}');
          } else {
            // Handle loading state
            return const CircularProgressIndicator();
          }
        },
      ),
      // CustomScrollView(
      //   controller: _scrollController,
      //   physics: const BouncingScrollPhysics(
      //     parent: AlwaysScrollableScrollPhysics(),
      //   ),
      //   slivers: const [
      //     CasesAppBar(),
      //     CasesSearchBar(),
      //     CasesView(),
      //   ],
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        _scrollController,
        key: const Key('__cases_screen_fab_key__'),
        title: S.of(context).addCase,
        onTap: () {
          // ref.read(collectionsProvider).conversationCollection.addConversation(
          //     title: "conversation ${ModelUtils.getTimestamp}");
          AddCaseRoute(CaseModelX.zero(), newRecord: true).push<void>(context);
        },
      ),
    );
  }
}
