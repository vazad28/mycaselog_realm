import 'package:flutter/material.dart';

enum ThemeContrast { normal, medium, high }

class CurrentTheme {
  CurrentTheme({
    required this.themeMode,
    required this.themeFontStyle,
    required this.themeContrast,
  });

  factory CurrentTheme.fromJson(Map<String, dynamic> map) {
    return CurrentTheme(
      themeMode: ThemeMode.values[map['themeMode'] as int],
      themeFontStyle: map['themeFontStyle'] as String,
      themeContrast:
          ThemeContrast.values.byName(map['themeContrast'] as String),
    );
  }
  final ThemeMode themeMode;
  final String themeFontStyle;
  final ThemeContrast themeContrast;

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.index, // Store as int for serialization
      'themeFontStyle': themeFontStyle,
      'themeContrast': themeContrast.name,
    };
  }

  CurrentTheme copyWith({
    ThemeMode? themeMode,
    String? themeFontStyle,
    ThemeContrast? themeContrast,
  }) {
    return CurrentTheme(
      themeMode: themeMode ?? this.themeMode,
      themeFontStyle: themeFontStyle ?? this.themeFontStyle,
      themeContrast: themeContrast ?? this.themeContrast,
    );
  }
}
