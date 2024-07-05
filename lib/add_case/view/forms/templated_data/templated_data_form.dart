import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../add_case.dart';

class AddCaseTemplatedDataForm extends ConsumerWidget with AddCaseStateMixin {
  const AddCaseTemplatedDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = watchTemplatedDataFormGroup(ref);

    return Expanded(
      child: form.controls.isEmpty
          ? Loading(text: S.of(context).noTemplateFields)
          : _TemplateDataFieldsBuilder(form: form),
    );
  }
}

class _TemplateDataFieldsBuilder extends ConsumerWidget {
  const _TemplateDataFieldsBuilder({
    required this.form,
  });

  final FormGroup form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsList = ref.read(currentCaseTemplateProvider)?.fields;

    if (fieldsList?.isEmpty ?? true) {
      return Loading(
        text: S.of(context).noTemplateFields,
      );
    }

    return ReactiveForm(
      formGroup: form,
      child: ListView(
        children: fieldsList!
            .map(
              (e) => FormyFields(
                templateField: e,
                decoration: context.inputDecorOutline(labelText: e.title),
              ).formFieldPadding(),
            )
            .toList(),
      ),
    );
  }
}
