part of '../forms.dart';

class TemplatedDataForm extends ConsumerWidget {
  const TemplatedDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(templatedDataFormGroupProvider);

    return Expanded(
      child: form.controls.isEmpty
          ? Loading(text: S.of(context).noTemplateFields)
          : _TemplateDataFieldsBuilder(form: form),
    );
  }
}

/// We take the form group to draw form from the form group provider
/// And only create fields that are in the current template
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
