import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../support_data.dart';

class ActivableBasicField extends ConsumerWidget {
  const ActivableBasicField(this.field, this.activeFields, {super.key});

  final List<ActivableAddCaseField> activeFields;
  final ActivableAddCaseField field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final labelText = field.name.titleCase;
    final active = activeFields.contains(field);

    return InkWell(
      onTap: () {
        final fields = List<ActivableAddCaseField>.from(activeFields);
        if (fields.contains(field)) {
          fields.remove(field);
        } else {
          fields.add(field);
        }
        ref
            .watch(supportDataNotifierProvider.notifier)
            .upsertActivableFields(fields);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: active
              ? const Icon(Icons.check)
              : Icon(
                  Icons.square,
                  color: context.colorScheme.error,
                ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIconConstraints: const BoxConstraints.tightFor(width: 36),
          filled: true,
          fillColor: active
              ? context.colorScheme.surface
              : context.colorScheme.errorContainer,
        ),
        child: Text(
          labelText,
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
