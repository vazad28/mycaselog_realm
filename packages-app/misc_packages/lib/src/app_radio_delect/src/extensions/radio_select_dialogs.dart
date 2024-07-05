import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../presentation/multi_select_modal.dart';
import '../presentation/radio_select_modal.dart';

extension RadioSelectDialogs on BuildContext {
  /// Radio select dialog
  Future<T?> openRadioSelectModal<T>(
      {required RadioSelectModal<T> modal, BuildContext? rootContext,}) {
    return Navigator.of(rootContext ?? this).push<T?>(
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          fullscreenDialog: true,
          pageBuilder: (BuildContext context, _, __) => modal,),
    );
  }

  /// Multi select dialog
  Future<List<T>?> openMultiSelectModal<T>({
    required MultiSelectModal<T> modal, BuildContext? rootContext,
  }) {
    return Navigator.of(rootContext ?? this).push<List<T>?>(
      PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          fullscreenDialog: true,
          pageBuilder: (BuildContext context, _, __) => modal,),
    );
  }
}
