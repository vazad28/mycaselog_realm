import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../core/core.dart';
import '../router/providers/app_router.dart';

class MycaselogApp extends ConsumerWidget with LoggerMixin {
  const MycaselogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider(context));

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

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(
        child: AsyncValueWidget(
          value: ref.watch(appStartUpProvider),
          data: (_) => materialApp,
          loading: _MyCaselogLoading(currentTheme: currentTheme),
        ),
      ),
    );
  }
}

class _MyCaselogLoading extends StatelessWidget {
  const _MyCaselogLoading({required this.currentTheme});

  final ThemeData currentTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
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
    );
  }
}
