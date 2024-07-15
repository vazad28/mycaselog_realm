import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/app_vars.dart';
import '../core/providers/providers.dart';
import '../router/providers/app_router.dart';
import '../sync/provider/sync_providers.dart';

class MycaselogApp extends ConsumerWidget {
  const MycaselogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(firestoreSyncProvider, (previous, next) {
      print('firestoreSyncProvider provider created');
    });

    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = createTextTheme(context, 'Roboto', 'Bebas Neue');

    final theme = MaterialTheme(textTheme);

    final themeMode = ref.watch(currentThemeModeProvider);

    final materialApp = MaterialApp.router(
      routerConfig: ref.read(mycaselogRouterProvider),
      scaffoldMessengerKey: AppVars.appScaffoldMessengerKey,
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
    );

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(child: materialApp),
    );
  }
}
