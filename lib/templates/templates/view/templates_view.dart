import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../templates.dart';

///
/// List of templates for the main screen
///
/// We pass the scroll controller to the list view
/// The controller allows the FAB button respond to the scrolling of the list
///
class TemplatesView extends ConsumerWidget {
  const TemplatesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showActiveOnly = ref.watch(showActiveTemplatesProvider);

    final templateModels = ref.watch(templatesListProvider);

    // ignore: no_leading_underscores_for_local_identifiers
    final _templateModels = showActiveOnly
        ? templateModels.where((value) => value.removed == 0).toList()
        : templateModels.where((value) => value.removed != 0).toList();

    return ListView.builder(
      controller: ref.watch(templatesListProvider.notifier).scrollController,
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: _templateModels.length,
      itemBuilder: (_, index) => TemplatesListTile(
        templateModel: _templateModels[index],
      ).paddingOnly(bottom: AppSpacing.md),
    );
  }
}
