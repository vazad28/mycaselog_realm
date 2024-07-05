import 'package:flutter/material.dart';

class HighlightMatchingText extends StatelessWidget {
  const HighlightMatchingText({required this.suggestion, required this.query, super.key});

  /// The sub-string that is highlighted inside {SubstringHighlight.text}.
  final String query;

  /// The String searched by {SubstringHighlight.term}.
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    if (query.isEmpty) {
      return Text(suggestion, style: textStyle);
    } else {
      final termLC = query.toLowerCase();

      final children = <InlineSpan>[];
      final spanList = suggestion.toLowerCase().split(termLC);
      var i = 0;
      for (final v in spanList) {
        if (v.isNotEmpty) {
          children.add(TextSpan(
              text: suggestion.substring(i, i + v.length),
              style: textStyle.copyWith(color: textStyle.color?.withAlpha(150)),),);
          i += v.length;
        }
        if (i < suggestion.length) {
          children.add(TextSpan(
              text: suggestion.substring(i, i + query.length),
              style: textStyle.copyWith(fontWeight: FontWeight.w600),),);
          i += query.length;
        }
      }
      return RichText(text: TextSpan(children: children));
    }
  }
}
