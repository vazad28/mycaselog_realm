import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../router/router.dart';
import '../../support_data.dart';

class AddAssistantPage extends ConsumerStatefulWidget {
  const AddAssistantPage({
    required this.assistantModel,
    super.key,
    this.newRecord = false,
  });

  final bool newRecord;
  final AssistantModel assistantModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAssistantPageState();
}

class _AddAssistantPageState extends ConsumerState<AddAssistantPage> {
  late FormGroup formGroup;

  @override
  void initState() {
    super.initState();

    formGroup = FormGroup({
      AssistantModelProps.name.name: FormControl<String>(
        value: widget.assistantModel.name,
        validators: [Validators.required, Validators.minLength(4)],
      ),
      AssistantModelProps.phone.name: FormControl<String>(
        value: widget.assistantModel.phone,
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      body: Center(
        child: _AddAssistantPageForm(
          formGroup: formGroup,
          title: widget.newRecord ? 'Add Assistant' : 'Edit Assistant',
          submitButton: FormSubmitButtonBar(
            onSubmit: () {
              /// update with basic data
              final assistantModelJson = {
                ...widget.assistantModel.toJson(),
                ...formGroup.value,
              };
              final model = AssistantModelX.fromJson(assistantModelJson);
              ref
                  .watch(supportDataNotifierProvider.notifier)
                  .upsertAssistant(model)
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

class _AddAssistantPageForm extends ConsumerWidget {
  const _AddAssistantPageForm({
    required this.formGroup,
    required this.submitButton,
    required this.title,
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
            formControlName: AssistantModelProps.name.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: AssistantModelProps.name.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The assistant name must be at least ${(error as Map)['requiredLength']} characters long',
            },
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: AssistantModelProps.phone.name,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            decoration: context.inputDecorOutline(
              labelText: AssistantModelProps.phone.name.titleCase,
            ),
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The assistant phone must be at least ${(error as Map)['requiredLength']} digits long',
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