import 'package:app_ui/app_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../core/providers/auth_providers.dart';
// import '../../main.dart' show firebaseAuthInstance;

class VerifyEmailPage extends ConsumerStatefulWidget {
  const VerifyEmailPage({required this.firebaseAuthInstance, super.key});

  final FirebaseAuth firebaseAuthInstance;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
  late final ctrl = EmailVerificationController(widget.firebaseAuthInstance)
    ..addListener(() {
      // trigger widget rebuild to reflect new state
      setState(() {});
    });

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final child = switch (ctrl.state) {
    //   EmailVerificationState.unresolved ||
    //   EmailVerificationState.unverified =>
    //     FilledButton(
    //       onPressed: () {
    //         ctrl.sendVerificationEmail(Theme.of(context).platform, null);
    //       },
    //       child: const Text('Send verification email'),
    //     ),
    //   EmailVerificationState.dismissed =>
    //     const Text("Ok, let's verify your email next time"),
    //   EmailVerificationState.pending ||
    //   EmailVerificationState.sending =>
    //     Loading(text: ctrl.state.name),
    //   EmailVerificationState.sent => const Text('Check your email'),
    //   EmailVerificationState.verified => const Text('Email verified'),
    //   EmailVerificationState.failed => const Text('Failed to verify email')
    // };

    final body = ResponsivePage(
      desktopLayoutDirection: TextDirection.ltr,
      headerBuilder: (context, constraints, shrinkOffset) {
        return const AspectRatio(aspectRatio: 1, child: AppLogo())
            .paddingAll(AppSpacing.xlg);
      },
      headerMaxExtent: MediaQuery.of(context).size.height * 0.3,
      sideBuilder: (_, constraints) {
        return const AspectRatio(aspectRatio: 1, child: AppLogo())
            .paddingAll(AppSpacing.xlg);
      },
      child: _EmailVerifificationPageContent(ctrl: ctrl)
          .paddingAll(AppSpacing.xlg),
    );

    return FirebaseUITheme(
      styles: const {},
      child: Scaffold(
        body: body,
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}

class _EmailVerifificationPageContent extends StatelessWidget {
  const _EmailVerifificationPageContent({required this.ctrl});

  final EmailVerificationController ctrl;

  EmailVerificationState get state => ctrl.state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        if (state == EmailVerificationState.unresolved ||
            state == EmailVerificationState.unverified)
          FilledButton(
            onPressed: () {
              ctrl.sendVerificationEmail(Theme.of(context).platform, null);
            },
            child: const Text('Send verification email'),
          ),
        if (state == EmailVerificationState.dismissed)
          const Text("Ok, let's verify your email next time"),
        if (state == EmailVerificationState.pending)
          const Center(child: Text('awaiting verification..'))
        else if (state == EmailVerificationState.sent) ...[
          Text(
            'Email verification sent',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
        if (state == EmailVerificationState.sending)
          const Center(child: Text('sending verification email..')),
        if (state == EmailVerificationState.unverified) ...[
          Text(
            'Resend verification email',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 16),
          FilledButton(
            child: const Text('re-send'),
            onPressed: () {
              ctrl.sendVerificationEmail(Theme.of(context).platform, null);
            },
          ),
        ],
        if (state == EmailVerificationState.failed) ...[
          const SizedBox(height: 16),
          ErrorText(exception: ctrl.error!),
        ],
        const SizedBox(height: 16),
        FilledButton(
          child: const Text('goBack'),
          onPressed: () {
            FirebaseUIAction.ofType<AuthCancelledAction>(context)
                ?.callback(context);
          },
        ),
      ],
    );
  }
}
