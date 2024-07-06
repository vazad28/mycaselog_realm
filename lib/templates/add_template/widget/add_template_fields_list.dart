import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../add_template_field/add_template_field.dart';
import '../add_template.dart';

class AddTemplateFieldList extends ConsumerWidget
    with AddTemplateFieldsEventMixin, AddTemplateFieldsStateMixin {
  const AddTemplateFieldList({super.key});

  /// if the temlplate has no fields
  Widget _importFieldButton(BuildContext context, WidgetRef ref) => Center(
        key: const Key('__add_template_no_fields_widget__'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => context
                  .openModalScreen<TemplateModel?>(
                const ImportTemplateFieldsModal(),
              )
                  .then((templateModel) {
                if (templateModel == null) return;
                importFields(ref, templateModel);
              }),
              child: Text(S.of(context).importFields),
            ),
            Text(
              'Import fields from your other templates',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsList = templateFieldsListState(ref);

    /// if we have fields
    return (fieldsList?.isEmpty ?? true)
        ? _importFieldButton(context, ref)
        : ReorderableListView(
            shrinkWrap: true,
            children: fieldsList!
                .asMap()
                .entries
                .map(
                  (entry) => Material(
                    key: ValueKey(entry.value),
                    color: context.colorScheme.surface,
                    child: TemplateFieldTile(
                      templateField: entry.value,
                      onDelete: () {
                        fieldsList
                            .removeAt(entry.key); //entry.key is mapEntry index
                        reOrderFields(ref, fieldsList);
                      },
                      onTap: () {
                        context
                            .openModalScreen<TemplateFieldModel?>(
                          AddTemplateFieldPage(
                            templateFieldModel: entry.value,
                            newRecord: false,
                          ),
                        )
                            .then((templateModel) {
                          if (templateModel != null) {
                            addUpdateField(ref, templateModel);
                          }
                        });
                        // AddTemplateFieldRoute(
                        //   entry.value,
                        //   templateID: templateID,
                        // ).push<void>(context);
                      },
                    ),
                  ),
                )
                .toList(),
            // The reorder function
            onReorder: (oldIndex, newIndex) {
              if (newIndex > oldIndex) {
                newIndex = newIndex - 1;
              }
              final element = fieldsList.removeAt(oldIndex);
              fieldsList.insert(newIndex, element);
              reOrderFields(ref, fieldsList);
            },
          );
  }
}
