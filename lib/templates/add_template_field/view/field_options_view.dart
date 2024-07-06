import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../provider/add_template_field_provider.dart';
import '../widgets/field_option_bar.dart';
import '../widgets/field_option_tile.dart';

class AddFieldOptionsView extends ConsumerWidget
    with AddTemplateFieldStateMixin {
  const AddFieldOptionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFieldType = templateFieldType(ref);

    return AnimatedOpacity(
      opacity: (currFieldType == FieldType.radio ||
              currFieldType == FieldType.select)
          ? 1
          : 0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddFieldOptionBar(
            onAddOption: (option) {
              ref
                  .watch(fieldOptionsProvider.notifier)
                  .updateFieldOption(option);
            },
          ),
          const Expanded(child: _AddFieldOptionsList()),
        ],
      ),
    );
  }
}

class _AddFieldOptionsList extends ConsumerWidget {
  const _AddFieldOptionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(fieldOptionsProvider.notifier);
    final fieldOptions = ref.watch(fieldOptionsProvider);

    return (fieldOptions?.isEmpty ?? true)
        ? const Center(child: Loading(text: 'Add an option for select'))
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: fieldOptions!
                .asMap()
                .entries
                .map(
                  (entry) => FieldOptionTile(
                    entry: entry,
                    onDelete: () {
                      context
                          .showConfirmDialog(
                        S.of(context).areYouSure,
                        title: S.of(context).alert,
                      )
                          .then((res) {
                        if (res == false) return;
                        notifier.removeFieldOption(entry.value);
                      });
                    },
                    onTap: () async {
                      final res = await context.showInputDialog<String?>(
                        title: S.of(context).addOption,
                        value: entry.value,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\n')),
                        ],
                      );
                      if (res?.isEmpty ?? true) return;
                      notifier.updateFieldOption(entry.value);
                    },
                  ),
                )
                .toList(),
          );
  }
}
