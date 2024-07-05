// ignore_for_file: use_build_context_synchronously

//library reactive_date_time_picker;

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveBooleanField extends ReactiveFormField<String, bool> {
  ReactiveBooleanField({
    required InputDecoration decoration,
    required Widget title,
    //ControlValueAccessor<bool, String>? valueAccessor,
    super.key,
    super.formControlName,
  }) : super(
          valueAccessor: BooleanValueAccessor(),
          builder: (field) {
            return InputDecorator(
              decoration: decoration.copyWith(
                contentPadding: const EdgeInsets.fromLTRB(16, 2, 8, 2),
                errorText: field.errorText,
                enabled: field.control.enabled,
              ),
              child: SwitchListTile(
                value: field.value ?? false,
                onChanged: (bool value) {
                  field.control.updateValueAndValidity();
                  field.didChange(value);
                },
                title: title,
                contentPadding: EdgeInsets.zero,
              ),
            );
          },
        );
}

/// Represents a control value accessor that convert between data types
/// [String] and [bool].
class BooleanValueAccessor extends ControlValueAccessor<String, bool> {
  @override
  bool? modelToViewValue(String? modelValue) {
    return modelValue == 'true';
  }

  @override
  String? viewToModelValue(bool? viewValue) {
    return viewValue == null
        ? null
        : viewValue
            ? 'true'
            : 'false';
  }
}
