import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      child: Container(
        width: 2,
        height: 2,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
