import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger_client/logger_client.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../app_radio_delect/src/radio_select.dart';
import '../formy_fields.dart';
import 'fields/reactive_boolean_field.dart';

class FormyFields extends StatelessWidget with LoggerMixin {
  const FormyFields({
    required this.templateField,
    super.key,
    this.decoration,
  });

  final TemplateFieldModel templateField;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    //logger.info('templateField.slug - ${templateField.slug}');

    /// default input text style for consistent ui
    final fieldTextStyle = Theme.of(context).textTheme.titleMedium;

    final fieldID = templateField.fieldID;

    /// field slug
    final slug = templateField.slug;

    // ignore: no_leading_underscores_for_local_identifiers
    final _decoration = decoration ??
        InputDecoration(
          isDense: true,
          labelText: templateField.title?.titleCase,
          suffixText: templateField.suffixText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIconConstraints: const BoxConstraints.tightFor(width: 28),
        );

    // ignore: no_leading_underscores_for_local_identifiers
    final _fieldID = fieldID;

    switch (templateField.fieldType) {
      case FieldType.bool:
        return ReactiveBooleanField(
          key: Key(_fieldID),
          formControlName: slug,
          decoration: _decoration,
          title: Text(templateField.title ?? 'No title', style: fieldTextStyle),
        );
      case FieldType.text:
        return ReactiveTextField<String>(
          key: Key(_fieldID),
          formControlName: slug,
          decoration: _decoration,
          style: fieldTextStyle,
          maxLines: null,
          keyboardType: TextInputType.text,
        );
      case FieldType.number:
        return ReactiveTextField<String>(
          formControlName: slug,
          decoration: _decoration,
          style: fieldTextStyle,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
          ],
        );
      case FieldType.radio:
        return ReactiveSingleSelectField(
          formControlName: slug,
          title: templateField.title ?? 'No title',
          decoration: _decoration,
          items: templateField.options
              .map((e) => RadioSelectOption(title: e, value: e))
              .toList(),
        );

      case FieldType.select:
        return ReactiveSelectField(
          formControlName: slug,
          title: templateField.title ?? 'No title',
          decoration: _decoration,
          items: templateField.options
              .map((e) => RadioSelectOption(title: e, value: e))
              .toList(),
        );

      // ignore: no_default_cases
      default:
        return const SizedBox(child: Text('No known form field found'));
    }
  }
}
