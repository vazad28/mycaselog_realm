import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../router/routes/routes.dart';
import '../../support_data.dart';

class AssistantsPage extends ConsumerWidget {
  const AssistantsPage({super.key});

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
              AddAssistantRoute().push<AssistantModel>(context);
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
    final assistants = ref.watch(
      supportDataNotifierProvider.select((data) => data.assistants),
    );

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
                .upsertAssistant(assistantModel, CrudAction.remove);
          },
          onTap: () =>
              AddAssistantRoute(assistantID: assistantModel.assistantID)
                  .push<AssistantModel>(context),
        );
      },
    );
  }
}
