import 'package:flutter/material.dart';

class FormSubmitButtonBar extends StatelessWidget {
  const FormSubmitButtonBar({
    required this.onSubmit,
    required this.onCancel,
    super.key,
    this.buttonText,
    this.outlined = false,
  });
  final VoidCallback onSubmit;
  final VoidCallback onCancel;
  final String? buttonText;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final buttons = outlined
        ? [
            OutlinedButton(
              onPressed: () {
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                return onCancel.call();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
                ),
                foregroundColor:
                    Theme.of(context).colorScheme.onSurface.withAlpha(150),
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: kRadialReactionRadius),
            OutlinedButton(
              onPressed: () {
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                return onSubmit.call();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                foregroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(buttonText ?? 'Save'),
            ),
          ]
        : [
            TextButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: kRadialReactionRadius),
            TextButton(onPressed: onSubmit, child: Text(buttonText ?? 'Save')),
          ];

    return SizedBox(
      height: kToolbarHeight,
      child: OverflowBar(alignment: MainAxisAlignment.center, children: buttons),
    );
  }
}
