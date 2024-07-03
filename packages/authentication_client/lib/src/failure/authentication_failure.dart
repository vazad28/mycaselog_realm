import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_failure.freezed.dart';

@Freezed(
  copyWith: true,
  equal: true,
  when: FreezedWhenOptions(when: false, maybeWhen: true, whenOrNull: false),
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class AuthenticationFailure with _$AuthenticationFailure implements Exception {
  const AuthenticationFailure._();

  const factory AuthenticationFailure.sendLoginEmailLinkFailure(Object? error) =
      SendLoginEmailLinkFailure;

  const factory AuthenticationFailure.signInInWithEmailLinkFailure(
    Object? error,
  ) = LogInWithEmailLinkFailure;

  const factory AuthenticationFailure.emailPasswordSignInFailure(
    Object? error,
  ) = EmailPasswordSignInFailure;

  const factory AuthenticationFailure.appleSignInFailure(Object? error) =
      AppleSignInFailure;

  const factory AuthenticationFailure.googleSignInFailure(Object? error) =
      GoogleSignInFailure;

  const factory AuthenticationFailure.facebookSignInFailure(Object? error) =
      FacebookSignInFailure;

  const factory AuthenticationFailure.twitterSignInFailure(Object? error) =
      TwitterSignInFailure;

  const factory AuthenticationFailure.signInCancelled(Object? error) =
      SignInCancelled;

  const factory AuthenticationFailure.signOutFailure(Object? error) =
      SignOutFailure;

  const factory AuthenticationFailure.passcodeUpdateFailure(Object? error) =
      PasscodeUpdateFailure;

  const factory AuthenticationFailure.fetchAppOpenedCountFailure(
    Object? error,
  ) = FetchAppOpenedCountFailure;

  const factory AuthenticationFailure.incrementAppOpenedCountFailure(
    Object? error,
  ) = IncrementAppOpenedCountFailure;

  // const factory AuthenticationFailure.sendVerificationEmailFailure(
  //   Object? error,
  // ) = SendVerificationEmailFailure;
}
