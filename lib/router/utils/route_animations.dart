import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<MaterialPage> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}

/// A page that fades and scale in an out.
class FadeThroughTransitionPage extends CustomTransitionPage<MaterialPage> {
  /// Creates a [FadeTransitionPage].
  FadeThroughTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
        );
}

/// A page that fades and scale in an out.
class SharedAxisTransitionPage extends CustomTransitionPage<MaterialPage> {
  /// Creates a [FadeTransitionPage].
  SharedAxisTransitionPage({
    required LocalKey super.key,
    required super.child,
    SharedAxisTransitionType? transitionType,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType:
                transitionType ?? SharedAxisTransitionType.horizontal,
            child: child,
          ),
        );
}

///
/// Transitions from animation package of flutter
///
Widget sharedAxisTransition(
  Widget child,
  Animation<double> primaryAnimation,
  Animation<double> secondaryAnimation,
) {
  return SharedAxisTransition(
    animation: primaryAnimation,
    secondaryAnimation: secondaryAnimation,
    transitionType: SharedAxisTransitionType.vertical,
    child: child,
  );
}

Widget fadeThroughTransition(
  Widget child,
  Animation<double> primaryAnimation,
  Animation<double> secondaryAnimation,
) {
  return FadeThroughTransition(
    animation: primaryAnimation,
    secondaryAnimation: secondaryAnimation,
    child: child,
  );
}
