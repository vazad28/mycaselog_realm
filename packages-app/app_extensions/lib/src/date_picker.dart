import 'package:flutter/material.dart';

extension PickersExtension on BuildContext {
  ///
  /// Show date picker
  ///
  Future<DateTime?> openDatePicker(
      {required DateTime initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      DatePickerMode? initialDatePickerMode,
      Widget Function(BuildContext, Widget?)? builder,}) {
    final context = this;
    return Future<void>.delayed(const Duration(milliseconds: 300)).then(
      (_) => showDatePicker(
        context: context,
        initialDatePickerMode: initialDatePickerMode ?? DatePickerMode.day,
        initialDate: initialDate,
        firstDate: firstDate ??
            initialDate.subtract(
              const Duration(days: 365 * 100),
            ),
        lastDate: lastDate ??
            initialDate.add(
              const Duration(days: 365 * 100),
            ),
        builder: builder,
      ),
    );
  }
}
