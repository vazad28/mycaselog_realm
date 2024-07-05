import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../add_assistant.dart';

class AddAssistantForm extends ConsumerWidget with AddAssistantStateMixin {
  const AddAssistantForm({
    required this.submitButton,
    required this.title,
    super.key,
  });
  final Widget submitButton;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///get form group from cubit getter
    final formGroup = getFormGroup(ref);

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
