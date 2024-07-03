import 'dart:async';
import 'dart:io' as io;

import 'package:app_ui/app_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logger_client/logger_client.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/providers.dart';
import 'firebase_options.dart';
import 'mycaselog_app.dart';

Future<void> main() async {
  // runZoneGuarder will run the body of this function in an error zone
  await runZonedGuarded<Future<void>>(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Keep native splash screen up until app is finished bootstrapping
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      // * Initialize Firebase
      final app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final firebaseAuthInstance = FirebaseAuth.instanceFor(app: app);

      /// * Register error handlers. For more info, see:
      /// * https://docs.flutter.dev/testing/errors
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      registerErrorHandlers();

      final providerContainer =
          await bootstrap(firebaseAuthInstance: firebaseAuthInstance);

      runApp(
        UncontrolledProviderScope(
          container: providerContainer,
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: MycaselogApp(),
          ),
        ),
      );

      // Remove splash screen when bootstrap is complete
      FlutterNativeSplash.remove();
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
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
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

///
/// Bootstrap function
/// A function to abstract away the creation of async code for main
/// It returns the provider container
///
Future<ProviderContainer> bootstrap({
  required FirebaseAuth firebaseAuthInstance,
}) async {
  /// Sets the URL strategy of your web app to using paths instead of a leading hash (#).
  //setPathUrlStrategy();

  /// Find the system locale and set it as the default for internationalization operations
  await findSystemLocale();

  /// initilize logger service  in app logger package
  initializeLogger();

  /// Specifies the style to use for overlays like status bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );

  /// Open ISAR database instance in the app directory
  final appDir = await getApplicationDocumentsDirectory();

  /// create an instance of shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  /// In debug mode we print the cache dir for local file access
  if (kDebugMode) {
    final cacheDir = await io.Directory('${appDir.path}/media_cache')
        .create(recursive: true);

    // final imgBytes =
    //     await io.File('${cacheDir.path}/missing_image.png').readAsBytes();

    // final intList = imgBytes.toList();

    // await io.File('${cacheDir.path}/missing_image.dart')
    //     .writeAsString(intList.toString());
    debugPrint(cacheDir.path);
  }

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
  return container..read(authenticationUserProvider);
  //..read(appSettingsProvider);
  //..read(supportDataNotifierProvider);
}
