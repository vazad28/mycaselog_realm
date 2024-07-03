
import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    required this.child, required this.padding, required this.color, super.key,
  });

  final Widget child;
  final Color color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(padding),
        color: color,
        child: child,
      ),
    );
  }
}

class TargetShapeCircle extends StatelessWidget {
  const TargetShapeCircle({super.key, this.padding, this.color});

  final Color? color;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return CircleWidget(
        color: Theme.of(context).colorScheme.surface,
        padding: padding ?? 0.0,
        child: Icon(
          Icons.circle,
          color: color ?? Theme.of(context).colorScheme.surfaceContainerHighest,
          size: 16,
        ),);
  }
}
