// ignore_for_file: use_build_context_synchronously

//library reactive_date_time_picker;

import 'package:app_extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
//import 'package:recase/recase.dart';

import '../../../app_radio_delect/src/radio_select.dart';

class ReactiveSingleSelectField extends ReactiveFormField<String, String> {
  ReactiveSingleSelectField({
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

                    field.control.focus();
                    field.control.updateValueAndValidity();

                    final value = field.control.value;

                    final newValue =
                        await field.context.openRadioSelectModal<String>(
                      modal: RadioSelectModal<String>(
                        items: items,
                        title: title,
                        subTitle: subTitle,
                        allowAdd: allowAdd,
                        selectedValue: field.control.value,
                      ),
                    );

                    if (newValue == null) return; //back button

                    /// does selected item exist in list
                    final exist = items
                        .map((e) => e.value)
                        .toList()
                        .containsIgnoreCaseSIL(newValue.trim());

                    /// we are allowing deselecting so we need to take that
                    /// into account
                    if (exist && newValue == value) {
                      if (exist) field.didChange(null);
                    } else {
                      field.didChange(newValue.trim());
                    }

                    field.control.unfocus();
                    field.control.updateValueAndValidity();
                    field.control.markAsTouched();
                  },
                  child: InputDecorator(
                    decoration: decoration.copyWith(
                      errorText: field.errorText,
                      enabled: field.control.enabled,
                      suffixIcon: suffixIcon ?? const Icon(Icons.unfold_more),
                    ),
                    isEmpty: isEmptyValue,
                    child: Text(
                      field.value?.titleCase ?? '',
                      style: Theme.of(field.context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
