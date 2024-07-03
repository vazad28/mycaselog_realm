import 'package:flutter/material.dart';

class FabButton extends StatelessWidget {
  const FabButton({
    required this.onPressed,
    this.icon = Icons.add,
    this.roundedCorner = false,
    super.key,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final bool roundedCorner;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kFloatingActionButtonMargin),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 6,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      shape: roundedCorner
          ? const CircleBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kFloatingActionButtonMargin),
            ),
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
