part of '../forms.dart';

@riverpod
FormGroup basicDataFormGroup(BasicDataFormGroupRef ref) {
  final caseModel = ref.watch(addCaseSeederProvider).requireValue;

  final controls = <String, AbstractControl<Object?>>{
    BasicDataModelProps.surgeryDate.name: FormControl<int>(
      value: caseModel.surgeryDate,
      validators: [Validators.required],
    ),
    BasicDataModelProps.diagnosis.name: FormControl<String>(
      value: caseModel.diagnosis,
      validators: [Validators.required],
    ),
    BasicDataModelProps.surgery.name: FormControl<String>(
      value: caseModel.surgery,
      validators: [Validators.required],
    ),
    BasicDataModelProps.anesthesia.name: FormControl<String>(
      value: caseModel.anesthesia,
      validators: [Validators.required],
    ),
    BasicDataModelProps.anesthesiaBlock.name: FormControl<String>(
      value: caseModel.anesthesiaBlock,
      validators: [],
    ),
    BasicDataModelProps.asa.name: FormControl<int>(
      value: caseModel.asa,
      validators: [Validators.required],
    ),
    BasicDataModelProps.side.name: FormControl<String>(
      value: caseModel.side,
      validators: [Validators.required],
    ),
    BasicDataModelProps.ebl.name: FormControl<int>(
      value: caseModel.ebl,
      validators: [],
    ),
    BasicDataModelProps.assistant.name: FormControl<List<String>>(
      value: caseModel.assistant,
      validators: [],
    ),
    BasicDataModelProps.location.name: FormControl<String>(
      value: caseModel.location,
      validators: [Validators.required],
    ),
    BasicDataModelProps.comments.name: FormControl<String>(
      value: caseModel.comments,
      validators: [],
    ),
    BasicDataModelProps.icd.name: FormControl<String>(
      value: caseModel.icd,
      validators: [],
    ),
    BasicDataModelProps.cpt.name: FormControl<String>(
      value: caseModel.cpt,
      validators: [],
    ),
  };

  return FormGroup(controls);
}
