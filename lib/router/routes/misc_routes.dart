import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth_flow/auth_flow.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/misc_routes.g.dart';

/// AuthFlow Route
@TypedGoRoute<AuthFlowRoute>(path: AuthFlowRoute.path)
class AuthFlowRoute extends GoRouteData {
  const AuthFlowRoute();
  static const name = 'auth_flow';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const AuthFlowPage(),
      );
}
