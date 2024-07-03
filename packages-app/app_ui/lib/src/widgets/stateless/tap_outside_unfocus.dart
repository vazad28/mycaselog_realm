import 'package:flutter/material.dart';

/// Simple wrapper that will clear focus when a tap is detected outside its boundaries
class TapOutsideUnfocus extends StatelessWidget {
  const TapOutsideUnfocus({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Clear focus of our fields when tapped in this empty space
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
