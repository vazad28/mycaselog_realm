import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../core/core.dart';
import '../router/providers/app_router.dart';
import '../sync/provider/firestore_live_sync.dart';

class MycaselogApp extends ConsumerWidget with LoggerMixin {
  const MycaselogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              : theme.dark().copyWith(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(), // This is required
                    ),
                  )
          : themeMode == 1
              ? theme.light()
              : theme.dark().copyWith(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(), // This is required
                    ),
                  ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );

    final app = AsyncValueWidget(
      value: ref.watch(appStartUpProvider),
      data: (_) => _MycaselogApp(app: (context) => materialApp),
      loading: const Text('loading'),
    );

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(child: app),
    );
  }
}

class _MycaselogApp extends ConsumerWidget with LoggerMixin {
  const _MycaselogApp({required this.app, super.key});

  final WidgetBuilder app;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Listen for settings provider to start or stop firebse sync
    ref.listen(firestoreLiveSyncProvider, (previous, next) {
      logger.fine('settingsNotifierProvider listening for sync');
    });
    //ref.watch(connectivityStatusProvider);

    return app(context);
  }
}
