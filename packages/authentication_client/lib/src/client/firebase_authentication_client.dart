import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:twitter_login/twitter_login.dart';

import '../../authentication_client.dart';

/// Signature for [SignInWithApple.getAppleIDCredential].
// typedef GetAppleCredentials = Future<AuthorizationCredentialAppleID> Function({
//   required List<AppleIDAuthorizationScopes> scopes,
//   WebAuthenticationOptions webAuthenticationOptions,
//   String nonce,
//   String state,
// });

/// {@template firebase_authentication_client}
/// A Firebase implementation of the [AuthenticationClient] interface.
/// {@endtemplate}
class FirebaseAuthenticationClient implements AuthenticationClient {
  /// {@macro firebase_authentication_client}
  FirebaseAuthenticationClient({
    required TokenStorage tokenStorage,
    required firebase_auth.FirebaseAuth firebaseAuth,
    GoogleSignIn? googleSignIn,
    //GetAppleCredentials? getAppleCredentials,
    //FacebookAuth? facebookAuth,
    //TwitterLogin? twitterLogin,
  })  : _tokenStorage = tokenStorage,
        _firebaseAuth = firebaseAuth,
        //_currentPasscodedUser = StreamController.broadcast(),
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard()
  // _getAppleCredentials =
  //     getAppleCredentials ?? SignInWithApple.getAppleIDCredential,
  // _facebookAuth = facebookAuth ?? FacebookAuth.instance,
  // _twitterLogin = twitterLogin ??
  //     TwitterLogin(
  //       apiKey: const String.fromEnvironment('TWITTER_API_KEY'),
  //       apiSecretKey: const String.fromEnvironment('TWITTER_API_SECRET'),
  //       redirectURI: const String.fromEnvironment('TWITTER_REDIRECT_URI'),
  //     ) {
  {
    user.listen(_onUserChanged);
  }

  final TokenStorage _tokenStorage;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  // final GetAppleCredentials _getAppleCredentials;
  // final FacebookAuth _facebookAuth;
  // final TwitterLogin _twitterLogin;

  /// Stream of [AuthenticationUser] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AuthenticationUser.anonymous] if the user is not authenticated.
  @override
  Stream<AuthenticationUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null
          ? AuthenticationUser.anonymous
          : firebaseUser.toUser;
    });
  }

  /// Starts the Sign In with Apple Flow.
  ///
  /// Throws a [LogInWithAppleFailure] if an exception occurs.
  @override
  Future<void> logInWithApple() async {
    // try {
    //   final appleIdCredential = await _getAppleCredentials(
    //     scopes: [
    //       AppleIDAuthorizationScopes.email,
    //       AppleIDAuthorizationScopes.fullName,
    //     ],
    //   );
    //   final oAuthProvider = firebase_auth.OAuthProvider('apple.com');
    //   final credential = oAuthProvider.credential(
    //     idToken: appleIdCredential.identityToken,
    //     accessToken: appleIdCredential.authorizationCode,
    //   );
    //   await _firebaseAuth.signInWithCredential(credential);
    // } catch (error, stackTrace) {
    //   Error.throwWithStackTrace(
    //     AuthenticationFailure.appleSignInFailure(error),
    //     stackTrace,
    //   );
    // }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  @override
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const AuthenticationFailure.signInCancelled(null);
      }
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
    } on SignInCancelled {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AuthenticationFailure.googleSignInFailure(error),
        stackTrace,
      );
    }
  }

  /// Starts the Sign In with Facebook Flow.
  ///
  /// Throws a [LogInWithFacebookCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithFacebookFailure] if an exception occurs.
  @override
  Future<void> logInWithFacebook() async {
    // try {
    //   final loginResult = await _facebookAuth.login();
    //   if (loginResult.status == LoginStatus.cancelled) {
    //     throw const AuthenticationFailure.signInCancelled(null);
    //   } else if (loginResult.status == LoginStatus.failed) {
    //     throw AuthenticationFailure.facebookSignInFailure(loginResult.message);
    //   }

    //   final accessToken = loginResult.accessToken?.token;
    //   if (accessToken == null) {
    //     throw const AuthenticationFailure.facebookSignInFailure(
    //       'Sign in with Facebook failed due to an empty access token',
    //     );
    //   }

    //   final credential =
    //       firebase_auth.FacebookAuthProvider.credential(accessToken);

    //   await _firebaseAuth.signInWithCredential(credential);
    // } on SignInCancelled {
    //   rethrow;
    // } catch (error, stackTrace) {
    //   Error.throwWithStackTrace(
    //     AuthenticationFailure.facebookSignInFailure(error),
    //     stackTrace,
    //   );
    // }
  }

  /// Starts the Sign In with Twitter Flow.
  ///
  /// Throws a [LogInWithTwitterCanceled] if the flow is canceled by the user.
  /// Throws a [LogInWithTwitterFailure] if an exception occurs.
  @override
  Future<void> logInWithTwitter() async {
    // try {
    //   final loginResult = await _twitterLogin.loginV2();
    //   if (loginResult.status == TwitterLoginStatus.cancelledByUser) {
    //     throw const AuthenticationFailure.signInCancelled(
    //       'Sign in with Twitter canceled',
    //     );
    //   } else if (loginResult.status == TwitterLoginStatus.error) {
    //     throw AuthenticationFailure.twitterSignInFailure(
    //       loginResult.errorMessage,
    //     );
    //   }

    //   final authToken = loginResult.authToken;
    //   final authTokenSecret = loginResult.authTokenSecret;
    //   if (authToken == null || authTokenSecret == null) {
    //     throw const AuthenticationFailure.twitterSignInFailure(
    //       'Sign in with Twitter failed due to invalid auth token or secret',
    //     );
    //   }

    //   final credential = firebase_auth.TwitterAuthProvider.credential(
    //     accessToken: authToken,
    //     secret: authTokenSecret,
    //   );

    //   await _firebaseAuth.signInWithCredential(credential);
    // } on SignInCancelled {
    //   rethrow;
    // } catch (error, stackTrace) {
    //   Error.throwWithStackTrace(
    //     AuthenticationFailure.twitterSignInFailure(error),
    //     stackTrace,
    //   );
    // }
  }

  /// Signs out the current user which will emit
  /// [AuthenticationUser.anonymous] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AuthenticationFailure.signOutFailure(error),
        stackTrace,
      );
    }
  }

  /// Updates the user token in [TokenStorage] if the user is authenticated.
  Future<void> _onUserChanged(AuthenticationUser user) async {
    if (!user.isAnonymous) {
      await _tokenStorage.saveToken(user.id);
    } else {
      await _tokenStorage.clearToken();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AuthenticationFailure.signInInWithEmailLinkFailure(error),
        stackTrace,
      );
    }
  }

  @override
  Future<void> logInWithEmailPassword(String email, String password) async {}

  @override
  Future<void> signUpWithEmailPassword(String email, String password) async {}
}

extension on firebase_auth.User {
  AuthenticationUser get toUser {
    final creationTime = metadata.creationTime;
    final lastSignInTime = metadata.lastSignInTime;
    var isNewUser = false;

    if (creationTime != null && lastSignInTime != null) {
      final diff = lastSignInTime.difference(creationTime).inMilliseconds;
      isNewUser = diff < 10000;
    }

    return AuthenticationUser(
      id: uid,
      email: email,
      emailVerified: emailVerified,
      name: displayName,
      photo: photoURL,
      isNewUser: isNewUser,
    );
  }
}
