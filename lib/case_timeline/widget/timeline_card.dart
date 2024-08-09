import 'package:flutter/material.dart';

class TimelineCard extends StatelessWidget {
  final Widget header;
  final Widget body;
  final Widget? footer;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets padding;

  const TimelineCard({
    super.key,
    required this.header,
    required this.body,
    this.footer,
    this.borderRadius = 12.0,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: header),
              // Add any additional widgets in the header row here
            ],
          ),
          const SizedBox(height: 16),
          Expanded(child: body),
          const SizedBox(height: 16),
          footer ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
