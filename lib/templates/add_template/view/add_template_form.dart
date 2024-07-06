import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../add_template.dart';

class AddTemplateForm extends ConsumerWidget with AddTemplateStateMixin {
  const AddTemplateForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formGroupKey = ref.watch(addTemplateSeederProvider)?.templateID;

    return ReactiveForm(
      key: ValueKey('__${formGroupKey}__'),
      formGroup: getTemplateFieldFormGroup(ref),
      child: Column(
        children: [
          VerticalSpacer.normal,

          /// template title
          ReactiveTextField<String>(
            formControlName: TemplateModelProps.title.name,
            decoration: context.inputDecorOutline(
              labelText: TemplateModelProps.title.name.titleCase,
            ),
            onTapOutside: (_) => primaryFocus?.unfocus(),
          ).formFieldPadding(),

          /// template description
          ReactiveTextField<String>(
            formControlName: TemplateModelProps.desc.name,
            decoration: context.inputDecorOutline(
              labelText: TemplateModelProps.desc.name.titleCase,
            ),
            onTapOutside: (_) => primaryFocus?.unfocus(),
          ).formFieldPadding(),

          /// Spacer
          VerticalSpacer.normal,

          /// Controller bar for template fields
          const AddFieldBar(),

          /// fields list
          const Expanded(child: AddTemplateFieldList()),
        ],
      ),
    );
  }
}
