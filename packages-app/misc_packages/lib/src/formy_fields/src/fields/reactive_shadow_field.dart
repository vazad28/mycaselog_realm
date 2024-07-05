// ignore_for_file: use_build_context_synchronously

//library reactive_date_time_picker;

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveShadowField<T> extends ReactiveFormField<T, String> {
  ReactiveShadowField({
    required InputDecoration decoration,
    required ControlValueAccessor<T, String> valueAccessor,
    required Future<T> Function(ReactiveFormFieldState<T, String> field) onTap,
    super.key,
    super.formControlName,
  }) : super(
          valueAccessor: valueAccessor,
          builder: (field) {
            final isEmptyValue = field.value == null;

            return IgnorePointer(
              ignoring: !field.control.enabled,
              child: GestureDetector(
                onTap: () {
                  field.control.focus();
                  field.control.updateValueAndValidity();

                  onTap.call(field).then((modelValue) {
                    field.didChange(valueAccessor.modelToViewValue(modelValue));
                  });

                  field.control.unfocus();
                  field.control.updateValueAndValidity();
                  field.control.markAsTouched();
                },
                child: InputDecorator(
                  decoration: decoration.copyWith(
                    errorText: field.errorText,
                    enabled: field.control.enabled,
                  ),
                  //isFocused: field.control.hasFocus,
                  isEmpty: isEmptyValue,
                  child: Text(
                    field.value ?? '',
                    style: Theme.of(field.context).textTheme.titleMedium,
                  ),
                ),
              ),
            );
          },
        );
}
