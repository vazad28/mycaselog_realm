import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingSliver extends StatelessWidget {
  const LoadingSliver({
    super.key,
    this.text,
    this.style,
    this.showSpinner = false,
    this.color,
    this.child,
  });

  final Widget? child;
  final Color? color;
  final bool showSpinner;
  final TextStyle? style;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Loading(
        text: text,
        showSpinner: showSpinner,
        child: child,
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    this.text,
    this.style,
    this.showSpinner = false,
    //this.color,
    this.inverseColor = false,
    this.child,
  });

  final Widget? child;
  //final Color? color;
  final bool inverseColor;
  final bool showSpinner;
  final TextStyle? style;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final rowChildren = <Widget>[];
    var textStyle = style ?? theme.textTheme.bodyLarge;

    if (inverseColor) {
      textStyle = textStyle?.copyWith(color: theme.colorScheme.surface);
    }

    if (child != null) {
      rowChildren.add(child!);
    } else {
      if (showSpinner || (!showSpinner && text == null)) {
        final spinnerColor = inverseColor
            ? theme.colorScheme.surface
            : theme.colorScheme.onSurface;

        final spinnerWidget = Platform.isAndroid
            ? CircularProgressIndicator(
                strokeWidth: 1.5,
                valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
              )
            : CupertinoActivityIndicator(
                color: spinnerColor,
              );
        rowChildren.add(spinnerWidget);
      }
      if (text != null) {
        rowChildren
          ..add(const SizedBox(width: 16))
          ..add(Text(text ?? '', style: style, softWrap: true));
      }
    }

    /// we need align so that if parent of this widget has no boundaries
    /// the widget still uses alignment to position it
    return Align(
      child: Wrap(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren,
      ),
    );
  }
}
