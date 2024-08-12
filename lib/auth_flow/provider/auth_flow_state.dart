part of 'auth_flow_provider.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions(when: true, whenOrNull: false),
  map: FreezedMapOptions(map: true, maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class AuthFlowState with _$AuthFlowState {
  const AuthFlowState._();

  /// Not yet onboarded
  const factory AuthFlowState.unboarded() = _Unboarded;

  /// Not authenticated yet
  const factory AuthFlowState.unauthenticated() = _Unauthenticated;

  /// Authenticated
  const factory AuthFlowState.authenticated() = _Authenticated;

  /// Must have user model
  const factory AuthFlowState.authorized() = _Authorized;

  bool get isNewOrAuthenticated => this is _Authenticated || this is _Unboarded;
}

extension AuthFlowStateExtension on AuthFlowState {
  bool get isUnboarded => this is _Unboarded;
  bool get isAuthenticated => this is _Authenticated;
  bool get isUnauthenticated => this is _Unauthenticated;
  bool get isAuthorized => this is _Authorized;
}
