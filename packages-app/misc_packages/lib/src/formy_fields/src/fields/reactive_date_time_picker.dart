// ignore_for_file: use_build_context_synchronously

//library reactive_date_time_picker;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:reactive_forms/reactive_forms.dart';

enum ReactiveDatePickerFieldType {
  date,
  time,
  dateTime,
}

typedef GetInitialDate = DateTime Function(
  DateTime? fieldValue,
  DateTime lastDate,
);

typedef GetInitialTime = TimeOfDay Function(DateTime? fieldValue);

class ReactiveDateTimePicker extends ReactiveFormField<DateTime, String> {
  ReactiveDateTimePicker({
    super.key,
    super.formControlName,
    super.formControl,
    ControlValueAccessor<DateTime, String>? valueAccessor,
    super.validationMessages,
    super.showErrors,

    ////////////////////////////////////////////////////////////////////////////
    TextStyle? style,
    ReactiveDatePickerFieldType type = ReactiveDatePickerFieldType.date,
    InputDecoration? decoration,
    bool showClearIcon = true,
    Widget clearIcon = const Icon(Icons.clear),

    // common params
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    String? cancelText,
    String? confirmText,
    String? helpText,
    GetInitialDate? getInitialDate,
    GetInitialTime? getInitialTime,
    DateFormat? dateFormat,
    double disabledOpacity = 0.5,

    // date picker params
    DateTime? firstDate,
    DateTime? lastDate,
    DatePickerEntryMode datePickerEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    Locale? locale,
    TextDirection? textDirection,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    RouteSettings? datePickerRouteSettings,
    TextInputType? keyboardType,
    Offset? anchorPoint,

    // time picker params
    TimePickerEntryMode timePickerEntryMode = TimePickerEntryMode.dial,
    RouteSettings? timePickerRouteSettings,
  }) : super(
          valueAccessor:
              valueAccessor ?? _effectiveValueAccessor(type, dateFormat),
          builder: (field) {
            var suffixIcon = decoration?.suffixIcon;
            final isEmptyValue = field.value?.isEmpty ?? true;

            if (showClearIcon && !isEmptyValue) {
              suffixIcon = InkWell(
                borderRadius: BorderRadius.circular(25),
                child: clearIcon,
                onTap: () {
                  field.control.markAsTouched();
                  field.didChange(null);
                },
              );
            }

            final effectiveDecoration = (decoration ?? const InputDecoration())
                .applyDefaults(Theme.of(field.context).inputDecorationTheme)
                .copyWith(
                  suffixIcon: suffixIcon,
                );

            final effectiveValueAccessor =
                valueAccessor ?? _effectiveValueAccessor(type, dateFormat);

            final effectiveLastDate = lastDate ?? DateTime(2100);

            return IgnorePointer(
              ignoring: !field.control.enabled,
              child: Opacity(
                opacity: field.control.enabled ? 1 : disabledOpacity,
                child: GestureDetector(
                  onTap: () async {
                    DateTime? date;
                    TimeOfDay? time;
                    field.control.focus();
                    field.control.updateValueAndValidity();

                    if (type == ReactiveDatePickerFieldType.date ||
                        type == ReactiveDatePickerFieldType.dateTime) {
                      date = await showDatePicker(
                        context: field.context,
                        initialDate: (getInitialDate ?? _getInitialDate)(
                          field.control.value,
                          effectiveLastDate,
                        ),
                        firstDate: firstDate ?? DateTime(1900),
                        lastDate: effectiveLastDate,
                        initialEntryMode: datePickerEntryMode,
                        selectableDayPredicate: selectableDayPredicate,
                        helpText: helpText,
                        cancelText: cancelText,
                        confirmText: confirmText,
                        locale: locale,
                        useRootNavigator: useRootNavigator,
                        routeSettings: datePickerRouteSettings,
                        textDirection: textDirection,
                        builder: builder,
                        initialDatePickerMode: initialDatePickerMode,
                        errorFormatText: errorFormatText,
                        errorInvalidText: errorInvalidText,
                        fieldHintText: fieldHintText,
                        fieldLabelText: fieldLabelText,
                        keyboardType: keyboardType,
                        anchorPoint: anchorPoint,
                      );
                    }

                    if (type == ReactiveDatePickerFieldType.time ||
                        (type == ReactiveDatePickerFieldType.dateTime &&
                            // there is no need to show timepicker if cancel was
                            // pressed on datepicker
                            date != null)) {
                      time = await showTimePicker(
                        context: field.context,
                        initialTime: (getInitialTime ??
                            _getInitialTime)(field.control.value),
                        builder: builder,
                        useRootNavigator: useRootNavigator,
                        initialEntryMode: timePickerEntryMode,
                        cancelText: cancelText,
                        confirmText: confirmText,
                        helpText: helpText,
                        routeSettings: timePickerRouteSettings,
                      );
                    }

                    if (
                        // if `date` and `time` in `dateTime` mode is not empty...
                        (type == ReactiveDatePickerFieldType.dateTime &&
                                (date != null && time != null)) ||
                            // ... or if `date` in `date` mode is not empty ...
                            (type == ReactiveDatePickerFieldType.date &&
                                date != null) ||
                            // ... or if `time` in `time` mode is not empty ...
                            (type == ReactiveDatePickerFieldType.time &&
                                time != null)) {
                      final dateTime = _combine(date, time);

                      final value = field.control.value;
                      // ... and new value is not the same as was before...
                      if (value == null || dateTime.compareTo(value) != 0) {
                        // ... this means that cancel was not pressed at any moment
                        // so we can update the field
                        field.didChange(
                          effectiveValueAccessor.modelToViewValue(
                            _combine(date, time),
                          ),
                        );
                      }
                    }
                    field.control.unfocus();
                    field.control.updateValueAndValidity();
                    field.control.markAsTouched();
                  },
                  child: InputDecorator(
                    decoration: effectiveDecoration.copyWith(
                      errorText: field.errorText,
                      enabled: field.control.enabled,
                    ),
                    isFocused: field.control.hasFocus,
                    isEmpty: isEmptyValue,
                    child: Text(
                      field.value ?? '',
                      style: Theme.of(field.context)
                          .textTheme
                          .titleMedium
                          ?.merge(style),
                    ),
                  ),
                ),
              ),
            );
          },
        );

  static DateTimeValueAccessor _effectiveValueAccessor(
    ReactiveDatePickerFieldType fieldType,
    DateFormat? dateFormat,
  ) {
    switch (fieldType) {
      case ReactiveDatePickerFieldType.date:
        return DateTimeValueAccessor(
          dateTimeFormat: dateFormat ?? DateFormat('yyyy/MM/dd'),
        );
      case ReactiveDatePickerFieldType.time:
        return DateTimeValueAccessor(
          dateTimeFormat: dateFormat ?? DateFormat('HH:mm'),
        );
      case ReactiveDatePickerFieldType.dateTime:
        return DateTimeValueAccessor(
          dateTimeFormat: dateFormat ?? DateFormat('yyyy/MM/dd HH:mm'),
        );
    }
  }

  static DateTime _combine(DateTime? date, TimeOfDay? time) {
    var dateTime = DateTime(0);

    if (date != null) {
      dateTime = dateTime.add(date.difference(dateTime));
    }

    if (time != null) {
      dateTime = dateTime.add(Duration(hours: time.hour, minutes: time.minute));
    }

    return dateTime;
  }

  static DateTime _getInitialDate(DateTime? fieldValue, DateTime lastDate) {
    if (fieldValue != null) {
      return fieldValue;
    }

    final now = DateTime.now();
    return now.compareTo(lastDate) > 0 ? lastDate : now;
  }

  static TimeOfDay _getInitialTime(dynamic fieldValue) {
    if (fieldValue != null && fieldValue is DateTime) {
      return TimeOfDay(hour: fieldValue.hour, minute: fieldValue.minute);
    }

    return TimeOfDay.now();
  }
}
