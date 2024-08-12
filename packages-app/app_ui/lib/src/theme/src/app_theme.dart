import 'package:flutter/material.dart';

import '../../../app_ui.dart';

part './material_theme.dart';

class AppTheme {
  AppTheme(
    BuildContext context,
    CurrentTheme currentThemeObject,
  )   : themeContrast = currentThemeObject.themeContrast,
        textTheme = createTextTheme(
          context,
          currentThemeObject.themeFontStyle,
          currentThemeObject.themeFontStyle,
        );

  final TextTheme textTheme;
  final ThemeContrast themeContrast;

  ThemeData lightTheme() {
    return switch (themeContrast) {
      ThemeContrast.normal => theme(MaterialTheme.lightScheme()),
      ThemeContrast.medium => theme(MaterialTheme.lightMediumContrastScheme()),
      ThemeContrast.high => theme(MaterialTheme.lightHighContrastScheme()),
    };
  }

  ThemeData darkTheme() {
    return switch (themeContrast) {
      ThemeContrast.normal => theme(MaterialTheme.darkScheme()),
      ThemeContrast.medium => theme(MaterialTheme.darkMediumContrastScheme()),
      ThemeContrast.high => theme(MaterialTheme.darkHighContrastScheme()),
    };
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
        navigationRailTheme: const NavigationRailThemeData().copyWith(
          indicatorColor: colorScheme.primary,
          selectedLabelTextStyle: TextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
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
