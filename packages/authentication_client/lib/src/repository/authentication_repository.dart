import '../../authentication_client.dart';

/// {@template user_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro user_repository}
  AuthenticationRepository({
    required AuthenticationClient authenticationClient,
    // required PackageInfoClient packageInfoClient,
    required AuthenticationUserStorage authenticationUserStorage,
  })  : _authenticationClient = authenticationClient,
        //_packageInfoClient = packageInfoClient,
        _authenticationUserStorage = authenticationUserStorage;

  final AuthenticationClient _authenticationClient;
  //final PackageInfoClient _packageInfoClient;
  final AuthenticationUserStorage _authenticationUserStorage;

  Stream<AuthenticationUser> get authenticationUser =>
      _authenticationClient.user;

  /// Starts the Sign In with Apple Flow.
  Future<void> logInWithApple() async {
    try {
      await _authenticationClient.logInWithApple();
    } on AppleSignInFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(AppleSignInFailure(error), stackTrace);
    }
  }

  /// Starts the Sign In with Google Flow.
  Future<void> logInWithGoogle() async {
    try {
      await _authenticationClient.logInWithGoogle();
    } on GoogleSignInFailure {
      rethrow;
    } on SignInCancelled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GoogleSignInFailure(error), stackTrace);
    }
  }

  /// Starts the Sign In with Twitter Flow.
  Future<void> logInWithTwitter() async {
    try {
      await _authenticationClient.logInWithTwitter();
    } on TwitterSignInFailure {
      rethrow;
    } on SignInCancelled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(TwitterSignInFailure(error), stackTrace);
    }
  }

  /// Starts the Sign In with Facebook Flow.
  Future<void> logInWithFacebook() async {
    try {
      await _authenticationClient.logInWithFacebook();
    } on FacebookSignInFailure {
      rethrow;
    } on SignInCancelled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FacebookSignInFailure(error), stackTrace);
    }
  }

  /// Signs out the current user which will emit
  Future<void> logOut() async {
    try {
      await _authenticationClient.logOut();
    } on SignOutFailure {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(SignOutFailure(error), stackTrace);
    }
  }

  /// Returns the number of times the app was opened.
  Future<int> fetchAppOpenedCount() async {
    try {
      return _authenticationUserStorage.fetchAppOpenedCount();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        FetchAppOpenedCountFailure(error),
        stackTrace,
      );
    }
  }

  /// Increments the number of times the app was opened by 1.
  Future<void> incrementAppOpenedCount() async {
    try {
      final value = await fetchAppOpenedCount();
      final result = value + 1;
      _authenticationUserStorage.setAppOpenedCount(count: result);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        IncrementAppOpenedCountFailure(error),
        stackTrace,
      );
    }
  }

  void setOnboardedStatus() {
    _authenticationUserStorage.setUserHasOnboarded();
  }

  bool getOnboardedStatus() {
    return _authenticationUserStorage.getUserHasOnboarded();
  }

  bool getOnboardedTest() => false;
}
