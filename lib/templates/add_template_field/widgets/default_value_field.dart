import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../core/app_vars.dart';
import '../provider/add_template_field_provider.dart';

class DefaultValueField extends ConsumerWidget
    with AddTemplateFieldEventMixin, AddTemplateFieldStateMixin {
  const DefaultValueField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFieldType = templateFieldType(ref);

    switch (currFieldType) {
      case FieldType.text:
        return const _DefaultValueFieldText();
      case FieldType.radio:
        return const _DefaultValueFieldRadio();
      case FieldType.select:
        return const _DefaultValueFieldSelect();
      case FieldType.bool:
        return const _DefaultValueBoolField();
      // ignore: no_default_cases
      case FieldType.number:
        return const _DefaultValueFieldNumber();
    }
  }
}

class _DefaultValueBoolField extends ConsumerWidget {
  const _DefaultValueBoolField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveDropdownField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      decoration: context.inputDecorOutline(
        labelText: TemplateFieldModelProps.defaultValue.name.titleCase,
      ),
      items: ['true', 'false']
          .map(
            (grade) => DropdownMenuItem<String>(
              value: grade,
              child: Text(grade.titleCase),
            ),
          )
          .toList(),
    );
  }
}

class _DefaultValueFieldRadio extends ConsumerWidget {
  const _DefaultValueFieldRadio();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(fieldOptionsProvider) ?? <String>[];

    final items =
        options.map((e) => RadioSelectOption(title: e, value: e)).toList();

    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: context.inputDecorOutline(
        labelText: TemplateFieldModelProps.defaultValue.name,
        suffix: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      onTap: (formCtrl) => options.isEmpty
          ? null
          : context
              .openRadioSelectModal<String>(
              rootContext: AppVars.rootContext,
              modal: RadioSelectModal(
                items: items,
                title: TemplateFieldModelProps.defaultValue.name,
                selectedValue: formCtrl.value,
              ),
            )
              .then((newValue) {
              if (newValue == null) return;
              formCtrl.value = newValue;
            }),
    );
  }
}

class _DefaultValueFieldSelect extends ConsumerWidget {
  const _DefaultValueFieldSelect();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final options = ref.watch(fieldOptionsProvider) ?? <String>[];

    final items =
        options.map((e) => RadioSelectOption(title: e, value: e)).toList();

    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: context.inputDecorOutline(
        labelText: TemplateFieldModelProps.defaultValue.name,
        suffix: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      onTap: (formCtrl) => options.isEmpty
          ? null
          : context
              .openMultiSelectModal<String>(
              rootContext: AppVars.rootContext,
              modal: MultiSelectModal(
                items: items,
                title: TemplateFieldModelProps.defaultValue.name,
                selectedValues: formCtrl.value?.split(','),
              ),
            )
              .then((newValue) {
              if (newValue == null) return;
              formCtrl.value = newValue.join(',');
            }),
    );
  }
}

class _DefaultValueFieldText extends ConsumerWidget {
  const _DefaultValueFieldText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      decoration: context.inputDecorOutline(
        labelText: TemplateFieldModelProps.defaultValue.name,
      ),
    );
  }
}

class _DefaultValueFieldNumber extends ConsumerWidget {
  const _DefaultValueFieldNumber();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField<String>(
      formControlName: TemplateFieldModelProps.defaultValue.name,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: context.inputDecorOutline(
        labelText: TemplateFieldModelProps.defaultValue.name,
      ),
    );
  }
}
