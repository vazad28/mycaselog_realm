import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../stats/stats.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/stats_routes.g.dart';

@TypedGoRoute<StatsRoute>(
  path: StatsRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[],
)

/// Root media tab cases
class StatsRoute extends GoRouteData {
  const StatsRoute();
  static const name = 'stats';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const StatsPage(),
      );
}
