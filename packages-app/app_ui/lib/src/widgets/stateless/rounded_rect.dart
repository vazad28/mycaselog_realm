import 'package:flutter/material.dart';

class RoundedRect extends StatelessWidget {
  const RoundedRect({
    required this.child,
    this.padding,
    this.color,
    super.key,
  });
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        color: color ?? Colors.transparent,
        shape: const StadiumBorder(),
      ),
      child: child,
    );
  }
}
