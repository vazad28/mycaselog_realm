import 'package:flutter/material.dart';

class RadioSelectInputField extends StatelessWidget {
  const RadioSelectInputField({
    required this.labelText,
    required this.onSubmitted,
    super.key,
    this.initialValue,
  });

  final String labelText;
  final String? initialValue;
  final dynamic Function(String?) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: TextFormField(
          autofocus: true,
          decoration:
              InputDecoration(hintText: 'enter..', labelText: labelText),
          initialValue: initialValue,
          onFieldSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
