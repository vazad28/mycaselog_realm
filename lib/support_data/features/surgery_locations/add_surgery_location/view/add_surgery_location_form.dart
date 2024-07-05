import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../surgery_locations.dart';

class AddSurgeryLocationForm extends ConsumerWidget
    with AddSurgeryLocationStateMixin {
  const AddSurgeryLocationForm({
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
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.name.name,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.name.name,
              hintText: 'Location name',
            ),
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.address.name,
            textInputAction: TextInputAction.next,
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.address.name,
              hintText: 'Location address',
            ),
          ),
          VerticalSpacer.large,
          ReactiveTextField<String>(
            formControlName: SurgeryLocationProps.phone.name,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(15),
            ],
            decoration: context.inputDecorOutline(
              labelText: SurgeryLocationProps.phone.name,
              hintText: 'Location phone number',
            ),
          ),
          VerticalSpacer.normal,
          submitButton,
        ],
      ),
    );

    return CenterFormWrapper(child: child);
  }
}
