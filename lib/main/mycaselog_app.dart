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

    final currentTheme = themeMode == 0
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
                );

    final materialApp = MaterialApp.router(
      routerConfig: ref.read(mycaselogRouterProvider),
      scaffoldMessengerKey: AppVars.appScaffoldMessengerKey,
      theme: currentTheme,
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
      loading: SizedBox.expand(
        child: Material(
          type: MaterialType.card,
          color: currentTheme.colorScheme.surface,
          child: Center(
            child: Text(
              'MYCASELOG',
              style: currentTheme.textTheme.titleMedium
                  ?.copyWith(color: currentTheme.colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(child: app),
    );
  }
}

class _MycaselogApp extends ConsumerWidget with LoggerMixin {
  const _MycaselogApp({required this.app});

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

/* 
final app = ref.watch(appStartUpProvider).when(
      data: (_) => _MycaselogApp(app: (context) => materialApp),
      loading: ()=> Material(
        type: MaterialType.card,
        color: brightness == Brightness.light ? Colors.white : Colors.black,
        textStyle: TextStyle().copyWith(
          color: brightness == Brightness.light ? Colors.black : Colors.white,
        ),
        child: const Text('loading..'),
      ),
      error: (err,st)=> Center(
      child: Text(
        err.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.red),
      ),
    );
    ); */
