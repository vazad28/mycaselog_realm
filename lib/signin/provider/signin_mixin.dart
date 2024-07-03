part of './signin_provider.dart';

mixin SigninEventMixin {
  void signinWithApple(WidgetRef ref) => ref
      .watch(signinNotifierProvider.notifier)
      .on(const SigninEvent.signinAppleSubmitted());

  void signinWithGoogle(WidgetRef ref) => ref
      .watch(signinNotifierProvider.notifier)
      .on(const SigninEvent.signinGoogleSubmitted());

  void signinWithFacebook(WidgetRef ref) => ref
      .watch(signinNotifierProvider.notifier)
      .on(const SigninEvent.signinFacebookSubmitted());

  void signinWithWithEmail(WidgetRef ref) => ref
      .watch(signinNotifierProvider.notifier)
      .on(const SigninEvent.signinWithEmailSubmitted());
}

mixin SigninStateMixin {
  SigninState signInState(WidgetRef ref) => ref.watch(signinNotifierProvider);
}
