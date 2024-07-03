// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import '../../authentication_client.dart';
// import 'package:realm/realm.dart';

// class MongodbAuthenticationClient implements AuthenticationClient {
//   /// {@macro firebase_authentication_client}
//   MongodbAuthenticationClient({
//     required App realmApp,
//     required AuthenticationUserStorage authenticationUserStorage,
//     // GoogleSignIn? googleSignIn,
//     // GetAppleCredentials? getAppleCredentials,
//     // FacebookAuth? facebookAuth,
//     // TwitterLogin? twitterLogin,
//   })  : _realmApp = realmApp,
//         _authenticationUserStorage = authenticationUserStorage;

//   // _tokenStorage = tokenStorage,
//   // _firebaseAuth = firebaseAuth,
//   //_currentPasscodedUser = StreamController.broadcast(),
//   // _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
//   // _getAppleCredentials =
//   //     getAppleCredentials ?? SignInWithApple.getAppleIDCredential,
//   // _facebookAuth = facebookAuth ?? FacebookAuth.instance,
//   // _twitterLogin = twitterLogin ??
//   //     TwitterLogin(
//   //       apiKey: const String.fromEnvironment('TWITTER_API_KEY'),
//   //       apiSecretKey: const String.fromEnvironment('TWITTER_API_SECRET'),
//   //       redirectURI: const String.fromEnvironment('TWITTER_REDIRECT_URI'),
//   //     ) {
//   //   user.listen(_onUserChanged);
//   // }

//   //final TokenStorage _tokenStorage;
//   // final firebase_auth.FirebaseAuth _firebaseAuth;
//   // final GoogleSignIn _googleSignIn;
//   // final GetAppleCredentials _getAppleCredentials;
//   // final FacebookAuth _facebookAuth;
//   // final TwitterLogin _twitterLogin;
//   final App _realmApp;
//   final AuthenticationUserStorage _authenticationUserStorage;

//   @override
//   Stream<AuthenticationUser> get user {
//     return _realmApp.currentUser?.changes
//             .map((realmUser) => realmUser.user.toAuthenticationUser) ??
//         Stream.value(AuthenticationUser.anonymous);
//   }

//   @override
//   Future<void> logInWithEmailPassword(String email, String password) async {
//     try {
//       final currentUser = _realmApp.currentUser;

//       if (currentUser != null &&
//           currentUser.identities.first.provider == AuthProviderType.anonymous) {
//         await _realmApp.deleteUser(currentUser);
//       }
//       await currentUser?.logOut();

//       await _realmApp.logIn(Credentials.emailPassword(email, password));

//       //state = AuthFlowState.authenticated(loggedInUser.toAuthenticationUser);
//     } catch (error, stackTrace) {
//       Error.throwWithStackTrace(TwitterSignInFailure(error), stackTrace);
//     }
//   }

//   @override
//   Future<void> signUpWithEmailPassword(String email, String password) async {
//     try {
//       final currentUser = _realmApp.currentUser;

//       if (currentUser != null) {
//         if (currentUser.identities.first.provider !=
//             AuthProviderType.anonymous) {
//           await _realmApp.deleteUser(currentUser);
//         } else {
//           await currentUser.logOut();
//         }
//       }

//       EmailPasswordAuthProvider authProvider =
//           EmailPasswordAuthProvider(_realmApp);
//       await authProvider.registerUser(email, password);

//       await _realmApp.logIn(Credentials.emailPassword(email, password));
//     } catch (error, stackTrace) {
//       Error.throwWithStackTrace(EmailPasswordSignInFailure(error), stackTrace);
//     }
//   }

//   @override
//   Future<void> sendEmailVerification() {
//     // TODO: implement sendEmailVerification
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> logInWithApple() {
//     // TODO: implement logInWithApple
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> logInWithFacebook() {
//     // TODO: implement logInWithFacebook
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> logInWithGoogle() async {
//     try {
//       GoogleSignIn _googleSignIn = GoogleSignIn(
//         // Optional clientId
//         // clientId: 'your-client_id.apps.googleusercontent.com',
//         scopes: ['email'],
//       );

//       final googleAccount = await _googleSignIn.signIn();
//       final googleAuthentication = await googleAccount?.authentication;
//       final idToken = googleAuthentication?.idToken;

//       if (idToken == null) throw Exception('idToken is null');

//       final googleIdTokenCredentials = Credentials.googleIdToken(idToken);
//       final currentUser = await _realmApp.logIn(googleIdTokenCredentials);

//       print(currentUser.id);
//     } catch (err) {
//       debugPrint(err.toString());
//     }
//   }

//   @override
//   Future<void> logInWithTwitter() {
//     // TODO: implement logInWithTwitter
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> logOut() {
//     // TODO: implement logOut
//     throw UnimplementedError();
//   }

//   /// Returns the number of times the app was opened.
//   Future<int> fetchAppOpenedCount() async {
//     try {
//       return _authenticationUserStorage.fetchAppOpenedCount();
//     } catch (error, stackTrace) {
//       Error.throwWithStackTrace(
//         FetchAppOpenedCountFailure(error),
//         stackTrace,
//       );
//     }
//   }

//   /// Increments the number of times the app was opened by 1.
//   Future<void> incrementAppOpenedCount() async {
//     try {
//       final value = await fetchAppOpenedCount();
//       final result = value + 1;
//       _authenticationUserStorage.setAppOpenedCount(count: result);
//     } catch (error, stackTrace) {
//       Error.throwWithStackTrace(
//         IncrementAppOpenedCountFailure(error),
//         stackTrace,
//       );
//     }
//   }

//   void setOnboardedStatus() {
//     _authenticationUserStorage.setUserHasOnboarded();
//   }

//   bool getOnboardedStatus() {
//     return _authenticationUserStorage.getUserHasOnboarded();
//   }

//   bool getOnboardedTest() => false;
// }

// extension on User {
//   AuthenticationUser get toAuthenticationUser {
//     // final creationTime = metadata.creationTime;
//     // final lastSignInTime = metadata.lastSignInTime;
//     // var isNewUser = false;

//     // if (creationTime != null && lastSignInTime != null) {
//     //   final diff = lastSignInTime.difference(creationTime).inMilliseconds;
//     //   isNewUser = diff < 10000;
//     // }

//     return AuthenticationUser(
//       id: id,
//       email: profile.email,
//       //emailVerified: profile.emailVerified,
//       name: profile.name,
//       photo: profile.pictureUrl,
//       isNewUser: false,
//     );
//   }
// }
