import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/failures/app_failures.dart';
import '../templates.dart';

///
/// List of templates for the main screen
///
/// We pass the scroll controller to the list view
/// The controller allows the FAB button respond to the scrolling of the list
///
class TemplatesView extends ConsumerWidget
    with TemplatesEventMixin, TemplatesStateMixin {
  const TemplatesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => onTemplateTap(ref, const TemplatesEvent.refreshTemplates()),
      ),
      child: stateOfTemplates(ref).maybeWhen(
        orElse: () => const Loading(),
        success: _TemplatesList.new,
        failure: (f) => Loading(
          text: f.toLocalizedString(),
        ),
      ),
    );
  }
}

class _TemplatesList extends ConsumerWidget
    with TemplatesEventMixin, TemplatesStateMixin {
  const _TemplatesList(this.templateModels);

  final List<TemplateModel> templateModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showActiveOnly = showActiveTemplatesOnly(ref);

    // ignore: no_leading_underscores_for_local_identifiers
    final _templateModels = showActiveOnly
        ? templateModels.where((value) => value.removed == 0).toList()
        : templateModels.where((value) => value.removed != 0).toList();

    return ListView.builder(
      controller: templatesListScrollController(ref),
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: _templateModels.length,
      itemBuilder: (_, index) => TemplatesListTile(
        templateModel: _templateModels[index],
      ).paddingOnly(bottom: AppSpacing.md),
    );
  }
}
