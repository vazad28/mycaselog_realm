import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../router/routes/routes.dart';
import '../../../../support_data.dart';

class AssistantsView extends ConsumerWidget
    with AssistantsEventMixin, AssistantsStateMixin {
  const AssistantsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final assistants = assistantsListState(ref);

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
            updateAssistant(ref, assistantModel.copyWith(removed: 1));
          },
          onTap: () => AddAssistantRoute(assistantModel)
              .push<AssistantModel>(context)
              .then((model) {
            if (model != null) updateAssistant(ref, model);
          }),
        );
      },
    );
  }
}
