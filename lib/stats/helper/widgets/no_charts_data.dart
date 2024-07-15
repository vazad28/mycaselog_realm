import 'package:flutter/material.dart';

class NoChartsData extends StatelessWidget {
  const NoChartsData({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: text == null
          ? Icon(
              Icons.bubble_chart,
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
              size: 48,
            )
          : Text(
              text!,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
    );
  }
}
