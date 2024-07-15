import 'package:flutter/material.dart';

import '../domain/chart_colors.dart';

class LeftAxisTick extends StatelessWidget {
  const LeftAxisTick(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.onChartColor;
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
      ),
    );
  }
}

class BottomAxisTick extends StatelessWidget {
  const BottomAxisTick(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.onChartColor;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
      ),
    );
  }
}
