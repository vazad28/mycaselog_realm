import "package:flutter/material.dart";

import "../../../app_ui.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282474129),
      surfaceTint: Color(4282474129),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292338687),
      onPrimaryContainer: Color(4278197055),
      secondary: Color(4283850353),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292535033),
      onSecondaryContainer: Color(4279442475),
      tertiary: Color(4278216573),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289915903),
      onTertiaryContainer: Color(4278198055),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294572543),
      onSurface: Color(4279835680),
      onSurfaceVariant: Color(4282664782),
      outline: Color(4285822847),
      outlineVariant: Color(4291086032),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inversePrimary: Color(4289447935),
      primaryFixed: Color(4292338687),
      onPrimaryFixed: Color(4278197055),
      primaryFixedDim: Color(4289447935),
      onPrimaryFixedVariant: Color(4280829559),
      secondaryFixed: Color(4292535033),
      onSecondaryFixed: Color(4279442475),
      secondaryFixedDim: Color(4290692828),
      onSecondaryFixedVariant: Color(4282271577),
      tertiaryFixed: Color(4289915903),
      onTertiaryFixed: Color(4278198055),
      tertiaryFixedDim: Color(4287025641),
      onTertiaryFixedVariant: Color(4278210142),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293388526),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280566387),
      surfaceTint: Color(4282474129),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283987369),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282008404),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285298056),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209113),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281106068),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572543),
      onSurface: Color(4279835680),
      onSurfaceVariant: Color(4282401610),
      outline: Color(4284243815),
      outlineVariant: Color(4286085763),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inversePrimary: Color(4289447935),
      primaryFixed: Color(4283987369),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282342542),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285298056),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283653231),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281106068),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216057),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293388526),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278198603),
      surfaceTint: Color(4282474129),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280566387),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279902770),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282008404),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199856),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209113),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572543),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362027),
      outline: Color(4282401610),
      outlineVariant: Color(4282401610),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217078),
      inversePrimary: Color(4293258495),
      primaryFixed: Color(4280566387),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278529115),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282008404),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280560957),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209113),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202941),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467168),
      surfaceBright: Color(4294572543),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294177786),
      surfaceContainer: Color(4293783028),
      surfaceContainerHigh: Color(4293388526),
      surfaceContainerHighest: Color(4293059305),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289447935),
      surfaceTint: Color(4289447935),
      onPrimary: Color(4278988895),
      primaryContainer: Color(4280829559),
      onPrimaryContainer: Color(4292338687),
      secondary: Color(4290692828),
      onSecondary: Color(4280823873),
      secondaryContainer: Color(4282271577),
      onSecondaryContainer: Color(4292535033),
      tertiary: Color(4287025641),
      onTertiary: Color(4278203970),
      tertiaryContainer: Color(4278210142),
      onTertiaryContainer: Color(4289915903),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279309080),
      onSurface: Color(4293059305),
      onSurfaceVariant: Color(4291086032),
      outline: Color(4287533209),
      outlineVariant: Color(4282664782),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4282474129),
      primaryFixed: Color(4292338687),
      onPrimaryFixed: Color(4278197055),
      primaryFixedDim: Color(4289447935),
      onPrimaryFixedVariant: Color(4280829559),
      secondaryFixed: Color(4292535033),
      onSecondaryFixed: Color(4279442475),
      secondaryFixedDim: Color(4290692828),
      onSecondaryFixedVariant: Color(4282271577),
      tertiaryFixed: Color(4289915903),
      onTertiaryFixed: Color(4278198055),
      tertiaryFixedDim: Color(4287025641),
      onTertiaryFixedVariant: Color(4278210142),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279835680),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289907711),
      surfaceTint: Color(4289447935),
      onPrimary: Color(4278195765),
      primaryContainer: Color(4285895111),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290956256),
      onSecondary: Color(4279047718),
      secondaryContainer: Color(4287140261),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4287289070),
      onTertiary: Color(4278196512),
      tertiaryContainer: Color(4283341745),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309080),
      onSurface: Color(4294703871),
      onSurfaceVariant: Color(4291349204),
      outline: Color(4288717484),
      outlineVariant: Color(4286612364),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4280961145),
      primaryFixed: Color(4292338687),
      onPrimaryFixed: Color(4278194219),
      primaryFixedDim: Color(4289447935),
      onPrimaryFixedVariant: Color(4279514725),
      secondaryFixed: Color(4292535033),
      onSecondaryFixed: Color(4278718753),
      secondaryFixedDim: Color(4290692828),
      onSecondaryFixedVariant: Color(4281218631),
      tertiaryFixed: Color(4289915903),
      onTertiaryFixed: Color(4278195226),
      tertiaryFixedDim: Color(4287025641),
      onTertiaryFixedVariant: Color(4278205513),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279835680),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294703871),
      surfaceTint: Color(4289447935),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289907711),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294703871),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290956256),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294311167),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287289070),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309080),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294703871),
      outline: Color(4291349204),
      outlineVariant: Color(4291349204),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059305),
      inversePrimary: Color(4278266201),
      primaryFixed: Color(4292732927),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289907711),
      onPrimaryFixedVariant: Color(4278195765),
      secondaryFixed: Color(4292798461),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290956256),
      onSecondaryFixedVariant: Color(4279047718),
      tertiaryFixed: Color(4290768639),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287289070),
      onTertiaryFixedVariant: Color(4278196512),
      surfaceDim: Color(4279309080),
      surfaceBright: Color(4281809214),
      surfaceContainerLowest: Color(4278980115),
      surfaceContainerLow: Color(4279835680),
      surfaceContainer: Color(4280164389),
      surfaceContainerHigh: Color(4280822319),
      surfaceContainerHighest: Color(4281546042),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      ).copyWith(
        // prevent platform depended padding values in material widgets
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.standard,

        //
        splashColor: colorScheme.secondary.withOpacity(.1),
        highlightColor: colorScheme.secondary.withOpacity(.1),

        //
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: 20,
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.onSurface.withOpacity(.2),
        ),
        cardTheme: CardTheme(
          elevation: 0.5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          color: colorScheme.surface,
          margin: EdgeInsets.zero,
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: colorScheme.inverseSurface,
          actionTextColor: colorScheme.primary,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? colorScheme.primary
                : null,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith(
            (state) => state.contains(WidgetState.selected)
                ? colorScheme.primary
                : null,
          ),
          trackColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? colorScheme.primary.withAlpha(0x80)
                : null,
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enableFeedback: true,
          elevation: 0,
          color: colorScheme.surfaceContainerHighest,
          textStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppSpacing.lg),
          border: OutlineInputBorder(
            //borderRadius: shape.borderRadius,
            borderSide: BorderSide(
              color: colorScheme.onSurface.withOpacity(.4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            //borderRadius: shape.borderRadius,
            borderSide: BorderSide(
              color: colorScheme.onSurface.withOpacity(.4),
            ),
          ),
          hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(.4)),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: colorScheme.primary,
          thumbColor: colorScheme.primary,
          valueIndicatorColor: colorScheme.primary.withOpacity(.8),
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorTextStyle: textTheme.titleMedium?.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        tooltipTheme: TooltipThemeData(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          textStyle:
              textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary),
          preferBelow: false,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: colorScheme.primary.withOpacity(.8),
          ),
        ),
        scrollbarTheme: const ScrollbarThemeData(
          radius: Radius.circular(16),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: colorScheme.surface,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: colorScheme.primary,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        ),
        navigationDrawerTheme: NavigationDrawerThemeData(
          indicatorColor: colorScheme.primary,
        ),
        navigationRailTheme: NavigationRailThemeData().copyWith(
          indicatorColor: colorScheme.primary,
          selectedLabelTextStyle: TextStyle(
              color: colorScheme.primary, fontWeight: FontWeight.bold),
          unselectedLabelTextStyle: TextStyle(
            color: colorScheme.onSurface,
          ),
          selectedIconTheme: IconThemeData(color: colorScheme.onPrimary),
        ),
        // buttons
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size.zero),
            shape: WidgetStateProperty.all(
              //RoundedRectangleBorder(borderRadius: shape.borderRadius),
              const StadiumBorder(),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: AppSpacing.md,
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size.zero),
            side: WidgetStateProperty.all(
              BorderSide(color: colorScheme.primary.withOpacity(.8)),
            ),
            shape: WidgetStateProperty.all(
              const StadiumBorder(),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              const StadiumBorder(),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: WidgetStateProperty.all(Size.zero),
            shape: WidgetStateProperty.all(
              const StadiumBorder(),
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.disabled)
                  ? colorScheme.primary.withOpacity(.12)
                  : colorScheme.primary,
            ),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.disabled)
                  ? colorScheme.onSurface.withOpacity(.38)
                  : colorScheme.onPrimary,
            ),
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return colorScheme.onPrimary.withOpacity(0.08);
              } else if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.pressed)) {
                return colorScheme.onPrimary.withOpacity(0.24);
              } else {
                return null;
              }
            }),
          ),
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

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
