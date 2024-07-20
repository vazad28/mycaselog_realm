import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/widgets/async_value_widget.dart';
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
  void dispose() {
    Future<void>.delayed(Durations.short1)
        .then((_) => _scrollController.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('__cases_screen_scaffold_key__'),
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        surfaceTintColor: context.colorScheme.surfaceTint,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: const [
          CasesAppBar(),
          CasesSearchBar(),
          _CasesView(key: Key('__cases_view_sub_key__')),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        _scrollController,
        key: const Key('__cases_screen_fab_key__'),
        title: S.of(context).addCase,
        onTap: () {
          AddCaseRoute(CaseModelX.zero(), newRecord: true).push<void>(context);
        },
      ),
    );
  }
}

class _CasesView extends ConsumerWidget {
  const _CasesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueSliverWidget<RealmResultsChanges<CaseModel>>(
      key: key,
      value: ref.watch(casesStreamProvider),
      data: (data) {
        return CasesView(
          caseModels: data.results,
        );
      },
    );

    // return stream.when(
    //   data: (data) {
    //     return CasesView(
    //       caseModels: data.results,
    //     );
    //   },
    //   error: buildErrorSliver,
    //   loading: buildLoadingSliver,
    // );
  }
}
