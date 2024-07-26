import 'dart:async';

import 'package:authentication_client/authentication_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';

part 'auth_flow_state.dart';

part '../../generated/auth_flow/provider/auth_flow_provider.freezed.dart';
part '../../generated/auth_flow/provider/auth_flow_provider.g.dart';

@riverpod
class AuthFlowNotifier extends _$AuthFlowNotifier with LoggerMixin {
  @override
  AuthFlowState build() {
    _authenticationRepository = ref.watch(authenticationRepositoryProvider);
    _authenticationUser = ref.read(authenticationUserProvider);

    _userSubscription =
        _authenticationRepository.authenticationUser.listen(_userChanged);

    ref.onDispose(() {
      _userSubscription.cancel();
    });

    return _getAuthState(_authenticationUser);
  }

  late final AuthenticationRepository _authenticationRepository;
  //late final NotificationsRepository _notificationsRepository;
  late final AuthenticationUser _authenticationUser;

  late StreamSubscription<AuthenticationUser> _userSubscription;

  /// The number of app opens after which the login overlay is shown
  /// for an unauthenticated user.
  //static const _appOpenedCountForLoginOverlay = 5;

  void _userChanged(AuthenticationUser user) {
    state = _getAuthState(user);
  }

  AuthFlowState _getAuthState(AuthenticationUser user) {
    return user.isAnonymous && !_authenticationRepository.getOnboardedStatus()
        ? const AuthFlowState.unboarded()
        : user.isAnonymous || !user.isEmailVerified
            ? const AuthFlowState.unauthenticated()
            : AuthFlowState.authenticated(user);
  }

  /// to be called when we have app start up completed to refresh router and
  /// load the app for access to only authorized user  and not just logged in
  /// user and also having all async dependencies loaded like ISAR
  void onAuthorized() {
    state = AuthFlowState.authorized(state.authenticationUser);
  }

  void onOnboardingCompleted() {
    if (state.isUnboarded) {
      _authenticationRepository.setOnboardedStatus();

      state.authenticationUser == AuthenticationUser.anonymous
          ? state = const AuthFlowState.unauthenticated()
          : state = AuthFlowState.authenticated(state.authenticationUser);
    }
  }

  void onLogoutRequested() {
    // We are disabling notifications when a user logs out because
    // the user should not receive any notifications when logged out.
    // unawaited(_notificationsRepository.toggleNotifications(enable: false));

    unawaited(_authenticationRepository.logOut());
  }
}
