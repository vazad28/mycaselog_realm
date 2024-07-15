import 'dart:io' as io;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl_standalone.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/providers/providers.dart';

///
/// Bootstrap function
/// A function to abstract away the creation of async code for main
/// It returns the provider container
///
Future<ProviderContainer> bootstrap(
  FirebaseAuth firebaseAuthInstance,
) async {
  /// Register error handlers. For more info, see:
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  registerErrorHandlers();

  /// Find the system locale and set it as the default for internationalization operations
  await findSystemLocale();

  /// get the app directory
  final appDir = await getApplicationDocumentsDirectory();

  /// In debug mode we print the cache dir for local file access
  if (kDebugMode) {
    final cacheDir = await io.Directory('${appDir.path}/media_cache')
        .create(recursive: true);
    debugPrint(cacheDir.path);
  }

  /// create an instance of shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    // only for Flutter, dart apps require listening to container to get changes as
    // ProviderObserver plugs into the widget lifecycle.
    overrides: [
      firebaseAuthInstanceProvider.overrideWithValue(firebaseAuthInstance),
      sharedPrefsProvider.overrideWithValue(sharedPreferences),
      appDirPathProvider.overrideWithValue(appDir.path),
    ],
    //observers: [_Logger()],
  );

  /// call read on these providers to self initialize them for app use
  return container;
  //..read(authenticationUserProvider);
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
