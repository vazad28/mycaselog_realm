// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/platform_widget.dart';

/// {@template ui.shared.widgets.button_buttonType}
/// An enumeration of the possible button buttonTypes.
/// {@endtemplate}
enum ButtonType {
  /// buttonType that is rendered as a text without a background or border.
  text,

  /// button buttonType that has a background.
  filled,

  /// button buttonType that has a border.
  outlined,
}

/// Button widget that uses [CupertinoButton] under [CupertinoApp] and
/// [TextButton], [ElevatedButton] or [OutlinedButton] under [MaterialApp]
/// depending on provided [buttonType].
class AppButton extends PlatformWidget {
  const AppButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
    this.materialIcon,
    this.cupertinoIcon,
    this.direction = TextDirection.ltr,
    this.buttonType = ButtonType.filled,
    this.materialColor,
    this.cupertinoColor,
    this.contentColor,
  }) : assert(
          text != null || child != null,
          'Cant not have child and text together',
        );

  /// A callback that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The text to display in the button.
  /// If [child] is provided, this will be ignored.
  final String? text;

  /// The child to display in the button.
  final Widget? child;

  /// The icon to display in the button under [MaterialApp].
  final IconData? materialIcon;

  /// The icon to display in the button under [CupertinoApp].
  final IconData? cupertinoIcon;

  /// Defines the order of the icon and the label.
  /// Icon will be placed on the left if [TextDirection.ltr] and on the right
  /// if [TextDirection.rtl].
  final TextDirection? direction;

  /// The buttonType of the button.
  /// If not provided, [ButtonType.filled] will be used.
  final ButtonType buttonType;

  /// The color of the button background under [MaterialApp].
  final Color? materialColor;

  /// The color of the button background under [CupertinoApp].
  final Color? cupertinoColor;

  /// The color of the button content.
  final Color? contentColor;

  @override
  Widget buildCupertino(BuildContext context) {
    late Widget button;

    final child = Row(
      textDirection: direction,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (cupertinoIcon != null) ...[
          if (direction == TextDirection.rtl) const SizedBox(width: 8),
          Icon(cupertinoIcon, size: 20, color: contentColor),
          if (direction == TextDirection.ltr) const SizedBox(width: 8),
        ],
        this.child ?? Text(text!),
      ],
    );

    if (buttonType == ButtonType.text || buttonType == ButtonType.outlined) {
      button = CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child,
      );
    } else {
      button = CupertinoButton.filled(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: child,
      );
    }

    if (cupertinoColor != null) {
      return CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(primaryColor: cupertinoColor),
        child: button,
      );
    } else {
      return button;
    }
  }

  @override
  Widget buildMaterial(BuildContext context) {
    final child = this.child ?? Text(text!);

    ButtonStyle? style;

    if (materialColor != null) {
      WidgetStateColor? foregroundColor;
      WidgetStateColor? backgroundColor;

      if (buttonType == ButtonType.text) {
        foregroundColor = WidgetStateColor.resolveWith((_) => materialColor!);
      } else {
        foregroundColor = WidgetStateColor.resolveWith((_) => contentColor!);
        backgroundColor = WidgetStateColor.resolveWith((_) => materialColor!);
      }

      style = ButtonStyle(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        overlayColor: WidgetStateColor.resolveWith(
          (states) => materialColor!.withAlpha(20),
        ),
      );
    }

    if (materialIcon != null) {
      switch (buttonType) {
        case ButtonType.text:
          return TextButton.icon(
            icon: Icon(materialIcon, color: contentColor),
            onPressed: onPressed,
            label: child,
            style: style,
          );
        case ButtonType.filled:
          return ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(materialIcon, color: contentColor),
            label: child,
            style: style,
          );
        case ButtonType.outlined:
          return OutlinedButton.icon(
            onPressed: onPressed,
            icon: Icon(materialIcon, color: contentColor),
            label: child,
            style: style,
          );
      }
    } else {
      switch (buttonType) {
        case ButtonType.text:
          return TextButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );
        case ButtonType.filled:
          return ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );
        case ButtonType.outlined:
          return OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );
      }
    }
  }
}
