import 'package:freezed_annotation/freezed_annotation.dart';
part '../../generated/signin/provider/signin_state.freezed.dart';

/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class SigninEvent with _$SigninEvent {
  const factory SigninEvent.signinAppleSubmitted() = _SigninAppleSubmitted;
  const factory SigninEvent.signinGoogleSubmitted() = _SigninGoogleSubmitted;
  const factory SigninEvent.signinFacebookSubmitted() =
      _SigninFacebookSubmitted;
  const factory SigninEvent.signinWithEmailSubmitted() =
      _SigninWithEmailSubmitted;
}

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = _Loading;
  const factory SigninState.success() = _Success;
  const factory SigninState.cancelled() = _Cancelled;
  const factory SigninState.failure(Exception error) = _Failure;
}

extension SigninStateExtension on SigninState {
  bool get isInitial => this is _Initial;
  bool get isLoading => this is _Loading;
  bool get isSuccess => this is _Success;
  bool get isFailure => this is _Failure;
  bool get isCancelled => this is _Cancelled;
}
