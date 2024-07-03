import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    required this.label,
    super.key,
    this.color,
    this.backgroundColor,
  });

  final String label;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    const indent = 16.0;

    final child = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
      ),
    );

    return SizedBox(
      height: 24,
      child: Row(
        children: [
          Flexible(
            child: Divider(
              indent: indent,
              endIndent: indent,
              thickness: 1,
              color: color,
            ),
          ),
          if (backgroundColor != null)
            Material(
              shape: const StadiumBorder(),
              color: backgroundColor,
              child: child,
            ),
          if (backgroundColor == null) child,
          Flexible(
            child: Divider(
              indent: indent,
              endIndent: indent,
              thickness: 1,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
