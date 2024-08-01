// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6tEeD0k6TosKN5Skhf-iDU40eGb3o7sk',
    appId: '1:768480572372:android:153795ac48d9eee3325c41',
    messagingSenderId: '768480572372',
    projectId: 'mycaselog-vik',
    storageBucket: 'mycaselog-vik.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdRLz5n1eorWm0nbE7BZdwyU7zY24VrZU',
    appId: '1:768480572372:ios:15c4987a542815c9325c41',
    messagingSenderId: '768480572372',
    projectId: 'mycaselog-vik',
    storageBucket: 'mycaselog-vik.appspot.com',
    androidClientId:
        '768480572372-022mmmmmoim3q373sushahs2tcqerhin.apps.googleusercontent.com',
    iosClientId:
        '768480572372-t1vj2nj5ju68j37dfdpr3k9pmmmvmitd.apps.googleusercontent.com',
    iosBundleId: 'com.vik.mycaselog',
  );
}
