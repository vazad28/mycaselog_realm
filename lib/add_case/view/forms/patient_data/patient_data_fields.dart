part of '../forms.dart';

/// ----- Patient name field -----
class PatientNameField extends ConsumerWidget with AppMixins {
  const PatientNameField({
    required this.cryptControl,
    required this.nameControl,
    super.key,
  });

  final AbstractControl<String?>? cryptControl;
  final AbstractControl<String?>? nameControl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = PatientDataModelProps.initials.name;

    return ReactiveTextField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name,
        suffixIcon: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      onTap: (control) async {
        try {
          final crypt = cryptControl?.value;

          DecryptedPatientModel? decryptedPatientModel;

          /// if crypt string not null, create the decrypted model
          /// using decryption service
          if (crypt != null) {
            final either = ref.read(decryptPatientModelProvider(crypt));
            decryptedPatientModel =
                either.when(failure: (l) => null, success: (r) => r);
          }

          /// check local auth if not debug mode
          if (buildMode == BuildMode.release &&
              ref.read(settingsNotifierProvider).localAuthEnabled) {
            final authenticated =
                await ref.read(dialogServiceProvider).localAuth();
            if (!authenticated) return;
          }

          /// get decryptedpatient data model from the add patient modal
          final decryptedPatientModelUpdated =
              // ignore: use_build_context_synchronously
              await context.openModalScreen<DecryptedPatientModel?>(
            AddPatientModal(
              decryptedPatientModel: decryptedPatientModel,
            ),
          );

          if (decryptedPatientModelUpdated == null) return;

          /// create crypt string from decrypted data
          final encrypted =
              encryptDecryptedPatientModel(ref, decryptedPatientModelUpdated);
          cryptControl?.value = encrypted;
          nameControl?.value = decryptedPatientModelUpdated.name;

          control.value =
              decryptedPatientModelUpdated.name?.initials.toUpperCase();
        } catch (err) {
          ref.watch(dialogServiceProvider).showSnackBar('err: $err');
        }
      },
    );
  }
}

/// ----- Patient  Gender  Field -----
class PatientGenderField extends StatelessWidget {
  const PatientGenderField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = PatientDataModelProps.gender.name;
    return ReactiveDropdownField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name.titleCase,
        //contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      ),
      items: S.current.genderList
          .split(',')
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      // showErrors: (control) =>
      //     control.invalid && control.touched && control.dirty,
    );
  }
}

/// ----- Patient Year of Birth  Field -----
class PatientYobField extends StatelessWidget {
  const PatientYobField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = PatientDataModelProps.yob.name;
    return ReactiveTextField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name.titleCase,
        hintText: 'Birth year',
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      //valueAccessor: YobValueAccessor(),
    );
  }
}

/// ----- BMI field -----
class PatientBmiField extends StatelessWidget {
  const PatientBmiField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = PatientDataModelProps.bmi.name;
    return ReactiveTextField<double>(
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name.titleCase),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
