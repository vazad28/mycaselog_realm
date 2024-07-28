import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_flow/view/auth_flow_page.dart';
import '../core/providers/providers.dart';

class MycaselogAuthApp extends ConsumerWidget {
  const MycaselogAuthApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = createTextTheme(context, 'Roboto', 'Bebas Neue');

    final theme = MaterialTheme(textTheme);

    final themeMode = ref.watch(currentThemeModeProvider);
    debugPrint('rendering MycaselogAuthApp with themeMode = $themeMode');

    final materialApp = MaterialApp(
      theme: themeMode == 0
          ? brightness == Brightness.light
              ? theme.light()
              : theme.dark()
          : themeMode == 1
              ? theme.light()
              : theme.dark(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const AuthFlowPage(),
    );

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(child: materialApp),
    );
  }
}
