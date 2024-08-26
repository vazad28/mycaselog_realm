part of './app_theme.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);

  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFF034383),
    );
  }

  static ColorScheme lightMediumContrastScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xFF094070),
    );
  }

  static ColorScheme lightHighContrastScheme() {
    return ColorScheme.fromSeed(
      seedColor: const Color(0xff002341),
    );
  }

  static ColorScheme darkScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFB9880E),
    );
  }

  static ColorScheme darkMediumContrastScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFAC7C03),
    );
  }

  static ColorScheme darkHighContrastScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFF936901),
    );
  }

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });

  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
