import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../router/routes/routes.dart';
import '../../support_data.dart';

part '../../../generated/support_data/features/assistants/assistants_page.g.dart';

/// Provider to keep the state of Assistants
@riverpod
List<AssistantModel> assistantsList(AssistantsListRef ref) {
  final assistants = ref.watch(
    supportDataNotifierProvider.select(
      (value) =>
          value.assistants.where((element) => element.removed == 0).toList(),
    ),
  );

  return assistants;
}

class AssistantsPage extends ConsumerWidget {
  const AssistantsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: AssistantsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).assistants.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              AddAssistantRoute(AssistantModelX.zero(), newRecord: true)
                  .push<AssistantModel>(context);
            },
          ),
        ],
      ),
      body: const _AssistantsView(),
    );
  }
}

class _AssistantsView extends ConsumerWidget {
  const _AssistantsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final assistants = ref.watch(assistantsListProvider);

    if (assistants.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No assistants',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: assistants.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final assistantModel = assistants[index];
        return DismissibleListTile(
          title: assistantModel.name ?? 'No name',
          subTitle: assistantModel.phone,
          onDismissed: () {
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertAssistant(assistantModel..removed = 1);
          },
          onTap: () =>
              AddAssistantRoute(assistantModel).push<AssistantModel>(context),
        );
      },
    );
  }
}
