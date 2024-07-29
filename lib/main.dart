import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import 'auth_flow/auth_flow.dart';
import 'firebase_options.dart';
import 'main/bootstrap.dart';
import 'main/mycaselog_app.dart';
import 'main/mycaselog_auth_app.dart';

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

      /// Specifies the style to use for overlays like status bar
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      );

      /// initilize logger service  in app logger package
      initializeLogger();

      final providerContainer = await bootstrap(firebaseAuthInstance);

      runApp(
        UncontrolledProviderScope(
          container: providerContainer,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: AppStartupWidget(
              onAuthenticated: (context) => const MycaselogApp(),
              needsAuthentication: (context) => const MycaselogAuthApp(),
            ),
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

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    required this.onAuthenticated,
    required this.needsAuthentication,
    super.key,
  });

  final WidgetBuilder onAuthenticated;
  final WidgetBuilder needsAuthentication;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authUserState = ref.watch(authFlowNotifierProvider);

    return authUserState.maybeWhen(
      authorized: (_) => onAuthenticated(context),
      orElse: () => needsAuthentication(context),
    );
  }
}
