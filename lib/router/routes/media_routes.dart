import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../media/media.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/media_routes.g.dart';

@TypedGoRoute<MediaRoute>(
  path: MediaRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[],
)

/// Root tab media
class MediaRoute extends GoRouteData {
  const MediaRoute();
  static const name = 'media';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const MediaPage(),
      );
}
