// ignore_for_file: require_trailing_commas

import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../../core/app_vars.dart';
import '../provider/add_template_field_provider.dart';

class FieldTypeSelectorWidget extends ConsumerWidget
    with AddTemplateFieldEventMixin, AddTemplateFieldStateMixin {
  FieldTypeSelectorWidget({super.key});

  final items = FieldType.values
      .map(
        (e) => RadioSelectOption(
          title: e.name,
          value: e,
          subTitle: Text(e.description),
          trailing: Text(
            FieldType.bool.name,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      )
      .toList();

  final subTitle = const Text('Select type of field based on data');
  final title = 'Template Field Type';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFieldType = templateFieldType(ref);

    return FilledButton.icon(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeConstants.kMenuRadius),
        ),
        minimumSize: const Size.fromHeight(kToolbarHeight),
      ),
      onPressed: () => context
          .openRadioSelectModal<FieldType>(
        rootContext: AppVars.rootContext,
        modal: RadioSelectModal(
          items: items,
          title: title,
          subTitle: subTitle,
          selectedValue: currFieldType,
        ),
      )
          .then((radioSelectItem) {
        if (radioSelectItem == null) return;

        setTemplateFieldType(ref, radioSelectItem);
      }),
      label: Row(
        children: [
          Expanded(
            child: Text(
              currFieldType.description,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(
            width: AppSpacing.sm,
            child: Icon(ThemeConstants.suffixIcon),
          ),
        ],
      ),
      icon: const Text('Data Type'),
    );
  }
}
