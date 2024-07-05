import 'package:flutter/material.dart';

class ModalDoneButton extends StatelessWidget {
  const ModalDoneButton({required this.onPressed, this.icon, super.key});
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kFloatingActionButtonMargin),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 6,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      shape: const CircleBorder(),
      child: Icon(
        icon ?? Icons.done,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}

class ModalCancelButton extends StatelessWidget {
  const ModalCancelButton({required this.onPressed, this.icon, super.key});
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kFloatingActionButtonMargin),
      fillColor: Theme.of(context).colorScheme.surface,
      elevation: 6,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      shape: const CircleBorder(),
      child: Icon(
        icon ?? Icons.close,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}

class ModalAddOptionButton extends StatelessWidget {
  const ModalAddOptionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kFloatingActionButtonMargin),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 6,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kFloatingActionButtonMargin),
      ),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
