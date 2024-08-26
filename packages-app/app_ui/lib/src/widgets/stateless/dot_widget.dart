import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, this.width = 6.0, this.radius = 1});

  final double radius;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
