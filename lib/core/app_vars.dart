import 'package:flutter/material.dart';

class AppVars {
  /// Catcher Report Mode requires a NavigatorKey
  static final GlobalKey<NavigatorState> appRootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Scaffold messenger key for use in catcher
  static final GlobalKey<ScaffoldMessengerState> appScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Root context
  static BuildContext get rootContext => appRootNavigatorKey.currentContext!;
}
