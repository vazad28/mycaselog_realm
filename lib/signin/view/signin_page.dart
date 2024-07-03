import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/providers.dart';
import '../pages/verify_email_page.dart';
import '../signin.dart';

part '../pages/email_register_page.dart';
part '../pages/email_signin_page.dart';
part '../pages/forgot_password_page.dart';
part '../pages/social_signin_page.dart';

class SigninPage extends ConsumerWidget
    with SigninEventMixin, SigninStateMixin {
  const SigninPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SigninPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = [EmailAuthProvider()];

    final user = ref.read(authenticationUserProvider);
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Use with Google Fonts package to use downloadable fonts
    final textTheme = createTextTheme(context, 'Roboto', 'Bebas Neue');

    final theme = MaterialTheme(textTheme);

    return TapOutsideUnfocus(
      child: MaterialApp(
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: user.isAnonymous
            ? SigninRoutes.socialSignIn
            : user.isEmailVerified
                ? SigninRoutes.blankPage
                : SigninRoutes.verifyEmail,
        routes: {
          SigninRoutes.socialSignIn: (context) {
            return const SocialSigninPage();
          },
          SigninRoutes.emailSignIn: (context) {
            return EmailSigninPage(providers: providers);
          },
          SigninRoutes.emailSignUp: (context) {
            return EmailRegisterPage(providers: providers);
          },
          SigninRoutes.verifyEmail: (context) {
            return VerifyEmailPage(
              firebaseAuthInstance: ref.read(firebaseAuthInstanceProvider),
            );
          },
          SigninRoutes.forgotPassword: (context) {
            return ForgotPasswordPage(providers: providers);
          },
          SigninRoutes.profilePage: (context) {
            return ProfileScreen(providers: providers);
          },
          SigninRoutes.blankPage: (_) {
            return const Material(
              child: Center(child: Text('...')),
            );
          },
        },
      ),
    );
  }
}
