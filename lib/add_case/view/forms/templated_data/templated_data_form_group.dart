part of '../forms.dart';

@riverpod
class TemplatedDataFormGroup extends _$TemplatedDataFormGroup {
  // Initial FormGroup creation
  Map<String, String?> fieldsData = {};

  @override
  FormGroup build() {
    // Watch for changes in templateModel and update FormGroup
    ref.listen<TemplateModel?>(currentCaseTemplateProvider,
        (prev, nextTemplateModel) {
      if (nextTemplateModel == null || nextTemplateModel == prev) return;
      state = _formGroup(
        nextTemplateModel,
        fieldsData..addAll(state.value.cast<String, String?>()),
      );
    });

    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    fieldsData = caseModel.fieldsData.isEmpty
        ? <String, String?>{}
        : {
            for (final field in caseModel.fieldsData) field.slug: field.value,
          };

    if (caseModel.templateID == null) return FormGroup({});

    final templateModel = ref
        .watch(dbProvider)
        .templatesCollection
        .getSingle(caseModel.templateID!);

    return _formGroup(templateModel, fieldsData);
  }

  FormGroup _formGroup(
    TemplateModel? templateModel,
    Map<String, String?> currentValues,
  ) {
    if (templateModel == null) {
      return FormGroup({});
    }

    /// empty map for controls
    final controls = <String, AbstractControl<Object?>>{};

    /// iterate over the template fields and use the fields data to populate
    for (final templateField in templateModel.fields) {
      final slug = templateField.slug;

      controls.putIfAbsent(slug, () {
        if (templateField.fieldType == FieldType.text) {
          return FormControl<String>(
            value: currentValues[slug] ?? templateField.defaultValue,
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        } else if (templateField.fieldType == FieldType.number) {
          return FormControl<String>(
            value:
                currentValues[slug]?.toString() ?? templateField.defaultValue,
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        } else if (templateField.fieldType == FieldType.bool) {
          return FormControl<String>(
            value: (currentValues[slug] ?? templateField.defaultValue)
                ?.toString()
                .toLowerCase(),
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        } else if (templateField.fieldType == FieldType.radio) {
          return FormControl<String>(
            value: currentValues[slug] ?? templateField.defaultValue,
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        } else if (templateField.fieldType == FieldType.select) {
          return FormControl<String>(
            value: currentValues[slug] ?? templateField.defaultValue,
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        } else {
          return FormControl<String>(
            value: currentValues[slug] ?? templateField.defaultValue,
            validators: templateField.isRequired ? [Validators.required] : [],
          );
        }
      });
    }

    return FormGroup(controls);
  }
}
