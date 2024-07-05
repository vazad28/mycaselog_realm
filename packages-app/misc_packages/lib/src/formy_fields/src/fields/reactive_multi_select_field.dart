import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../../app_radio_delect/src/radio_select.dart';

class ReactiveMultiSelectField
    extends ReactiveFormField<List<String>, List<String>> {
  ReactiveMultiSelectField({
    required String title,
    required InputDecoration decoration,
    required List<RadioSelectOption<String>> items,
    super.key,
    super.formControlName,
    super.formControl,
    super.validationMessages,
    super.showErrors,
    Widget? subTitle,
    bool allowAdd = false,
    Icon? suffixIcon,
    double disabledOpacity = 0.5,
  }) : super(
          builder: (field) {
            final isEmptyValue = field.value?.isEmpty ?? true;

            return IgnorePointer(
              ignoring: !field.control.enabled,
              child: Opacity(
                opacity: field.control.enabled ? 1 : disabledOpacity,
                child: GestureDetector(
                  onTap: () async {
                    //if (items.isEmpty) return;

                    field.control
                      ..focus()
                      ..updateValueAndValidity();

                    final value = field.control.value;

                    final newValue =
                        await field.context.openMultiSelectModal<String>(
                      modal: MultiSelectModal<String>(
                        items: items,
                        title: title,
                        subTitle: subTitle,
                        allowAdd: allowAdd,
                        selectedValues: value,
                      ),
                    );

                    if (newValue != null) field.didChange(newValue);

                    field.control
                      ..unfocus()
                      ..updateValueAndValidity()
                      ..markAsTouched();
                  },
                  child: InputDecorator(
                    decoration: decoration.copyWith(
                      errorText: field.errorText,
                      enabled: field.control.enabled,
                      suffixIcon: suffixIcon ?? const Icon(Icons.unfold_more),
                    ),
                    //isFocused: field.control.hasFocus,
                    isEmpty: isEmptyValue,
                    child: Text(
                      field.value?.map((e) => e.titleCase).join(',') ?? '',
                      style: Theme.of(field.context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
