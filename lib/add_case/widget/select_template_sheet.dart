import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../core/core.dart';
import '../../router/router.dart';
import '../../templates/index.dart';
import '../add_case.dart';

/// Select template bottom sheet widget
typedef OnTemplateSelect = void Function(TemplateModel);

class SelectTemplateBottomSheet extends ConsumerWidget with AddCaseMixin {
  const SelectTemplateBottomSheet(this.currTemplate, {super.key});

  final TemplateModel? currTemplate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final templatesLists = ref.watch(dbProvider).templatesCollection.getAll();

    return AsyncValueWidget<Iterable<TemplateModel>>(
      value: ref.watch(templatesNotifierProvider),
      data: (templates) => _TemplatesBottomSheet(
        selectedTemplateID: currTemplate?.templateID,
        templates: templates.where((e) => e.removed == 0).toList(),
        onSelect: (templateModel) {
          if (currTemplate == null ||
              currTemplate?.templateID != templateModel.templateID) {
            /// call addCaseNotifier to set the current forms data into an
            /// object before the new template models fields are rendered
            ref
                .watch(currentCaseTemplateProvider.notifier)
                .onTemplateChange(templateModel);
            return;
          }
        },
      ),
    );
  }
}

///
/// Bottom sheet widget for showing template select bottomsheet dialog
///
class _TemplatesBottomSheet extends StatelessWidget {
  const _TemplatesBottomSheet({
    required this.templates,
    required this.onSelect,
    this.selectedTemplateID,
  });

  final OnTemplateSelect onSelect;
  final String? selectedTemplateID;
  final List<TemplateModel> templates;

  @override
  Widget build(BuildContext context) {
    if (templates.isEmpty) {
      return DraggableBottomSheetBuilder(
        child: ColoredBox(
          color: context.colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).noSurgeryTemplatesAvailable,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Create Template'),
                onPressed: () {
                  ///  go to add template screen
                  AddTemplateRoute(AddTemplateRoute.newItemParam)
                      .push<void>(context);
                },
              ),
            ],
          ),
        ),
      );
    }

    return DraggableBottomSheetBuilder(
      title: ListTile(
        dense: true,
        title: Text(S.of(context).selectSurgeryTemplate),
        trailing: TextButton(
          child: Text(S.of(context).close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      itemCount: templates.length,
      itemBuilder: (ctx, index) {
        final templateModel = templates[index];
        final active = selectedTemplateID == templateModel.templateID;

        return MaterialCard.outlined(
          padding: kTabLabelPadding,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          borderColor: active
              ? context.colorScheme.outline
              : context.colorScheme.surface,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              templateModel.title?.titleCase ?? S.of(context).noTitle,
            ),
            subtitle: Text(templateModel.desc ?? 'No description'),
          ),
          onTap: () {
            onSelect.call(templateModel);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
