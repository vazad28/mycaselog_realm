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
    // final providers = [EmailAuthProvider()];
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // final currentThemeObject = ref.watch(currentThemeNotifierProvider);
    // final theme = AppTheme(context, currentThemeObject);

    // final currentTheme = switch (currentThemeObject.themeMode) {
    //   ThemeMode.system => brightness == Brightness.light
    //       ? theme.lightTheme()
    //       : theme.darkTheme().copyWith(
    //             cupertinoOverrideTheme: const CupertinoThemeData(
    //               textTheme: CupertinoTextThemeData(), // This is required
    //             ),
    //           ),
    //   ThemeMode.light => theme.lightTheme(),
    //   ThemeMode.dark => theme.darkTheme().copyWith(
    //         cupertinoOverrideTheme: const CupertinoThemeData(
    //           textTheme: CupertinoTextThemeData(), // This is required
    //         ),
    //       )
    // };

    final currentTheme = ref.watch(currentThemeProvider(context));

    final materialApp = MaterialApp(
      theme: currentTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const AuthFlowPage(),
      // initialRoute: SigninRoutes.splash,
      // routes: {
      //   SigninRoutes.splash: (context) {
      //     return const SplashPage();
      //   },
      //   SigninRoutes.authFlow: (context) {
      //     return const AuthFlowPage();
      //   },
      //   SigninRoutes.socialSignIn: (context) {
      //     return const SocialSigninPage();
      //   },
      //   SigninRoutes.emailSignIn: (context) {
      //     return EmailSigninPage(providers: providers);
      //   },
      //   SigninRoutes.emailSignUp: (context) {
      //     return EmailRegisterPage(providers: providers);
      //   },
      //   SigninRoutes.verifyEmail: (context) {
      //     return VerifyEmailPage(
      //       firebaseAuthInstance: ref.read(firebaseAuthInstanceProvider),
      //     );
      //   },
      //   SigninRoutes.forgotPassword: (context) {
      //     return ForgotPasswordPage(providers: providers);
      //   },
      //   SigninRoutes.blankPage: (_) {
      //     return const Material(
      //       child: Center(child: Text('...')),
      //     );
      //   },
      // },
    );

    return PopScope(
      onPopInvokedWithResult: (bool didPop, result) => {},
      child: TapOutsideUnfocus(child: materialApp),
    );
  }
}
