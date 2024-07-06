import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedTemplateField extends ConsumerWidget {
  const SharedTemplateField({required this.templateField, super.key});

  final TemplateFieldModel templateField;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(templateField.title ?? S.of(context).noTitle),
      subtitle: Text(templateField.fieldType.name),
    );
  }
}
