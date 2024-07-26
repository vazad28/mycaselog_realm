import 'package:authentication_client/authentication_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';
import 'signin_state.dart';

part '../../generated/signin/provider/signin_provider.g.dart';
part './signin_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class SigninNotifier extends _$SigninNotifier with LoggerMixin {
  @override
  SigninState build() {
    return const SigninState.initial();
  }

  /// Map events to state
  void on(SigninEvent event) {
    event.map(
      signinAppleSubmitted: (_) => _onSigninAppleSubmitted(),
      signinGoogleSubmitted: (_) => _onSigninGoogleSubmitted(),
      signinFacebookSubmitted: (_) => _signinFacebookSubmitted(),
      signinWithEmailSubmitted: (_) => _signinWithEmailSubmitted(),
    );
  }

  Future<void> _onSigninAppleSubmitted() async {
    state = const SigninState.loading();
    try {
      await ref.read(authenticationClientProvider).logInWithApple();
    } on SignInCancelled {
      state = const SigninState.cancelled();
    } catch (err) {
      state = SigninState.failure(AppleSignInFailure(err));
      logger.severe(err.toString());
    }
  }

  Future<void> _onSigninGoogleSubmitted() async {
    state = const SigninState.loading();
    try {
      await ref.watch(authenticationClientProvider).logInWithGoogle();
    } on SignInCancelled {
      state = const SigninState.cancelled();
    } on GoogleSignInFailure catch (err) {
      state = SigninState.failure(GoogleSignInFailure(err));
    } catch (err) {
      state = SigninState.failure(Exception(err));
      logger.severe(err.toString());
    }
  }

  Object? _signinFacebookSubmitted() {
    throw UnimplementedError();
  }

  Object? _signinWithEmailSubmitted() {
    throw UnimplementedError();
  }
}
