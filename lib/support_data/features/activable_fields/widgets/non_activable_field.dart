import 'package:flutter/material.dart';

class NonActivableBsicDataField extends StatelessWidget {
  const NonActivableBsicDataField(this.labelText, {super.key});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Text(labelText),
    );
  }
}
