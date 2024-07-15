import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../add_template_field.dart';
import 'field_options_view.dart';

class AddTemplateFieldForm extends ConsumerWidget {
  const AddTemplateFieldForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroup = ref.watch(addTemplateFieldFormGroupProvider);

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          VerticalSpacer.normal,

          /// Field type selector
          FieldTypeSelectorWidget().formFieldPadding(),

          /// Field title textfield
          ReactiveTextField<String>(
            formControlName: TemplateFieldModelProps.title.name,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: TemplateFieldModelProps.title.name.titleCase,
            ),
          ).formFieldPadding(),

          /// suffix field
          ReactiveTextField<String>(
            formControlName: TemplateFieldModelProps.suffixText.name,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: TemplateFieldModelProps.suffixText.name,
              hintText: 'Units of data such as - cm, gm',
            ),
          ).formFieldPadding(),

          /// is required field
          ReactiveDropdownField<bool>(
            formControlName: TemplateFieldModelProps.isRequired.name,
            decoration: context.inputDecorOutline(
              labelText: TemplateFieldModelProps.isRequired.name,
            ),
            items: [true, false]
                .map(
                  (grade) => DropdownMenuItem<bool>(
                    value: grade,
                    child: Text(grade.toString().titleCase),
                  ),
                )
                .toList(),
          ).formFieldPadding(),

          /// default value field
          const DefaultValueField().formFieldPadding(),

          /// spacer
          VerticalSpacer.normal,

          /// fields list
          const Expanded(
            child: AddFieldOptionsView(),
          ),
        ],
      ),
    );
  }
}
