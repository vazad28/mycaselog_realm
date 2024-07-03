// Flutter imports:
import 'package:flutter/material.dart';

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  bool get isDark => theme.brightness == Brightness.dark;
}

extension ThemeExtensionX on ThemeData {
  Color get appBarBackgroundColor =>
      Color.lerp(
        colorScheme.surface,
        colorScheme.surfaceTint,
        0.075,
      ) ??
      colorScheme.surfaceTint.withOpacity(0.08);
}

extension TextStyleThemeX on TextStyle {
  TextStyle lighter([double amount = .5]) =>
      // ignore: unnecessary_this
      this.apply(color: this.color?.withOpacity(amount));
}

extension ColorModifier on Color {
  /// darken a color
  Color darker([double amount = .1]) {
    assert(
      amount >= 0 && amount <= 1,
      'amount has to be more than 0 and less than 1',
    );

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// lighten a color
  Color lighter([double amount = .1]) {
    assert(
      amount >= 0 && amount <= 1,
      'amount has to be more than 0 and less than 1',
    );

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
