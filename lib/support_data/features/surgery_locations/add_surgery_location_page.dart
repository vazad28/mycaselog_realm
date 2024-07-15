import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../router/router.dart';
import '../../support_data.dart';

class AddSurgeryLocationPage extends ConsumerStatefulWidget {
  const AddSurgeryLocationPage({
    required this.surgeryLocationModel,
    super.key,
    this.newRecord = false,
  });

  final bool newRecord;
  final SurgeryLocationModel surgeryLocationModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSurgeryLocationPageState();
}

class _AddSurgeryLocationPageState
    extends ConsumerState<AddSurgeryLocationPage> {
  late FormGroup formGroup;

  @override
  void initState() {
    super.initState();

    formGroup = FormGroup({
      SurgeryLocationProps.name.name: FormControl<String>(
        value: widget.surgeryLocationModel.name,
        validators: [Validators.required, Validators.minLength(3)],
      ),
      SurgeryLocationProps.phone.name: FormControl<String>(
        value: widget.surgeryLocationModel.phone,
        validators: [],
      ),
      SurgeryLocationProps.address.name: FormControl<String>(
        value: widget.surgeryLocationModel.address,
        validators: [],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: Center(
        child: _AddSurgeryLocationPageForm(
          formGroup: formGroup,
          title: widget.newRecord
              ? 'Add Surgery Location'
              : 'Edit Surgery Location',
          submitButton: FormSubmitButtonBar(
            onSubmit: () {
              /// update with basic data
              final surgeryLocationModelJson = {
                ...widget.surgeryLocationModel.toJson(),
                ...formGroup.value
              };
              final model =
                  SurgeryLocationModelX.fromJson(surgeryLocationModelJson);
              ref
                  .watch(supportDataNotifierProvider.notifier)
                  .upsertSurgeryLocation(model)
                  .then((_) {
                if (context.mounted) Navigator.of(context).pop();
              });
            },
            onCancel: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );

    return FormPopScopeWrapper(
      canPop: () => canPop(ref),
      visibilitySwitcher: (visibility) {
        ref
            .watch(bottomNavVisibilityProvider.notifier)
            .update(value: visibility);
      },
      routeObserver:
          ref.read(shellRoutesObserversProvider).settingsRouteObserver,
      child: scaffold,
    );
  }

  bool canPop(WidgetRef ref) => true;
}

class _AddSurgeryLocationPageForm extends ConsumerWidget {
  const _AddSurgeryLocationPageForm({
    required this.formGroup,
    required this.submitButton,
    required this.title,
    super.key,
  });
  final FormGroup formGroup;
  final Widget submitButton;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = ReactiveForm(
      formGroup: formGroup,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.name.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.name.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The surgeryLocation name must be at least ${(error as Map)['requiredLength']} characters long',
            },
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.phone.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.phone.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The surgery location phone must be at least ${(error as Map)['requiredLength']} digits long',
            },
          ),
          VerticalSpacer.large,
          submitButton,
        ],
      ),
    );

    return CenterFormWrapper(child: child);
  }
}
