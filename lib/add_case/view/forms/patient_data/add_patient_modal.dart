import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../../support_data/support_data.dart';
import '../../../provider/add_case_provider.dart';

/// AddPatientModal ROOT Widget
class AddPatientModal extends ConsumerStatefulWidget {
  const AddPatientModal({
    super.key,
    this.decryptedPatientModel,
  });

  final DecryptedPatientModel? decryptedPatientModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPatientModalController();
}

/// AddPatientModal CONTROLLER Widget
class _AddPatientModalController extends ConsumerState<AddPatientModal>
    with LoggerMixin {
  late DecryptedPatientModel decryptedPatientModel;

  /// Placeholder  variable for our form
  late FormGroup form;

  @override
  void initState() {
    decryptedPatientModel =
        widget.decryptedPatientModel ?? DecryptedPatientModel();

    form = createFormGroup();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _AddPatientModalView(this);
  }

  /// controller methods
  FormGroup createFormGroup() {
    final controls = <String, AbstractControl<Object?>>{
      DecryptedPatientDataModelProps.name.name: FormControl<String>(
        value: decryptedPatientModel.name,
        validators: [Validators.required],
      ),
      DecryptedPatientDataModelProps.mrn.name: FormControl<String>(
        value: decryptedPatientModel.mrn,
        validators: [Validators.required],
      ),
      DecryptedPatientDataModelProps.phone.name: FormControl<String>(
        value: decryptedPatientModel.phone,
      ),
      DecryptedPatientDataModelProps.address.name: FormControl<String>(
        value: decryptedPatientModel.address,
      ),
    };
    return FormGroup(controls);
  }

  /// controller methods
  void submit() {
    /// validate and if not valid abort
    if (form.invalid) {
      // marks all children as touched
      form.markAllAsTouched();

      logger.info('Basic data form is NOT valid');

      return;
    }

    final formToModel = DecryptedPatientModel.fromJson(
      decryptedPatientModel.toJson()..addAll(form.value),
    );

    context.pop(formToModel);
  }
}

/// AddPatientModal VIEW Widget
class _AddPatientModalView
    extends WidgetView<AddPatientModal, _AddPatientModalController> {
  const _AddPatientModalView(super.state);

  @override
  Widget build(BuildContext context) {
    final formFieldsWidget = Column(
      crossAxisAlignment:
          // ignore: avoid_redundant_argument_values
          CrossAxisAlignment.center, // important for button  animation
      children: <Widget>[
        const _PatientFormFields(
          key: Key('__patient_data_form_fields_widget__'),
        ),
        const SizedBox(height: 16),
        FormSubmitButtonBar(
          key: const Key('__patient_data_form_submit_button_bar__'),
          onSubmit: state.submit,
          onCancel: () => Navigator.of(context).pop(),
          buttonText: S.of(context).submit.titleCase,
        ),
        const SizedBox(height: 16),
      ],
    );

    final form = ReactiveForm(
      formGroup: state.form,
      child: formFieldsWidget,
    );

    return Scaffold(
      appBar: AppBar(),
      body: CenterFormWrapper(
        child: form,
      ),
    );
  }
}

///
/// const widget for form fields
class _PatientFormFields extends ConsumerWidget with AddCaseStateMixin {
  const _PatientFormFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFields = watchActiveFields(ref);

    /// name field
    final Widget nameInputField = ReactiveTextField<String>(
      formControlName: PatientDataModelProps.name.name,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      autofocus: true,
      decoration: context.inputDecorOutline(
        labelText: '${PatientDataModelProps.name.name.titleCase} *',
      ),
    );

    /// mrn field
    final Widget mrnInputField = ReactiveTextField<String>(
      formControlName: PatientDataModelProps.mrn.name,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: context.inputDecorOutline(
        labelText: '${PatientDataModelProps.mrn.name.titleCase} *',
      ),
    );

    return Column(
      children: <Widget>[
        //-- Patient name field
        nameInputField,
        VerticalSpacer.large,
        //--  MRN input field
        mrnInputField,
        //--- if activable field show phone
        if (activeFields.contains(ActivableAddCaseField.phone)) ...[
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: PatientDataModelProps.phone.name,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: PatientDataModelProps.phone.name.titleCase,
            ),
          ),
        ],
        //---- if activable fields show address
        if (activeFields.contains(ActivableAddCaseField.address)) ...[
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: PatientDataModelProps.address.name,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: PatientDataModelProps.address.name.titleCase,
            ),
          ),
        ],
      ],
    );
  }
}