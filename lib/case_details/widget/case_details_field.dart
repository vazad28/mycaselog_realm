import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class CaseDetailsField extends StatelessWidget {
  const CaseDetailsField({
    super.key,
    this.onTap,
    this.label,
    this.value,
    this.suffix,
  });

  final String? label;
  final VoidCallback? onTap;
  final String? suffix;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final child = InputDecorator(
      decoration: InputDecoration(
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label?.titleCase,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        hintText: 'enter..',
        suffixText: suffix,
      ),
      child: Text(value ?? '', style: Theme.of(context).textTheme.titleMedium),
    );
    return child.paddingAll(6);
  }
}
