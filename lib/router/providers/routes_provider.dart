import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../routes/routes.dart';
import '../views/app_bottom_nav_bar.dart';
import '../views/app_router_scaffold.dart';
import 'router_observers.dart';

part '../../generated/router/providers/routes_provider.g.dart';

@Riverpod(keepAlive: true)
List<NavigationDestination> rootNavDestinations(RootNavDestinationsRef ref) {
  return [
    /// cases
    NavigationDestination(
      label: CasesRoute.name.toUpperCase(),
      icon: const Icon(Icons.assignment_outlined),
      selectedIcon: const Icon(Icons.assignment),
    ),

    /// media
    NavigationDestination(
      label: MediaRoute.name.toUpperCase(),
      icon: const Icon(Icons.photo_outlined),
      selectedIcon: const Icon(Icons.photo),
    ),

    /// charts
    NavigationDestination(
      label: StatsRoute.name.toUpperCase(),
      icon: const Icon(Icons.insert_chart_outlined),
      selectedIcon: const Icon(Icons.insert_chart),
    ),

    /// notes
    NavigationDestination(
      label: NotesRoute.name.toUpperCase(),
      icon: const Icon(Icons.note_alt_outlined),
      selectedIcon: const Icon(Icons.note_alt),
    ),

    /// settings
    NavigationDestination(
      label: SettingsRoute.name.toUpperCase(),
      icon: const Icon(Icons.settings_outlined),
      selectedIcon: const Icon(Icons.settings),
    ),
  ];
}

/// Routes Provider
@Riverpod(keepAlive: true)
List<RouteBase> routes(RoutesRef ref) {
  debugPrint('routes provider called');
  final routesList = [
    $authFlowRoute,
    StatefulShellRoute.indexedStack(
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [$casesRoute],
          initialLocation: CasesRoute.path,
          observers: [
            ref.read(shellRoutesObserversProvider).casesRouteObserver,
          ],
        ),
        StatefulShellBranch(
          routes: [$mediaRoute],
          initialLocation: MediaRoute.path,
          observers: [
            ref.read(shellRoutesObserversProvider).mediaRouteObserver,
          ],
        ),
        StatefulShellBranch(
          routes: [$statsRoute],
          initialLocation: StatsRoute.path,
          observers: [
            ref.read(shellRoutesObserversProvider).statsRouteObserver,
          ],
        ),
        StatefulShellBranch(
          routes: [$notesRoute],
          initialLocation: NotesRoute.path,
          observers: [
            ref.read(shellRoutesObserversProvider).notesRouteObserver,
          ],
        ),
        StatefulShellBranch(
          routes: [$settingsRoute],
          initialLocation: SettingsRoute.path,
          observers: [
            ref.read(shellRoutesObserversProvider).settingsRouteObserver,
          ],
        ),
        // StatefulShellBranch(
        //   routes: [
        //     ShellRoute(
        //       builder:
        //           (BuildContext context, GoRouterState state, Widget child) {
        //         return child;
        //       },
        //       routes: [$statsRoute, $notesRoute, $templatesRoute],
        //     ),
        //   ],
        //   //initialLocation: MenuRoute.path,
        //   observers: [
        //     ref.read(shellRoutesObserversProvider).menuRouteObserver,
        //   ],
        // ),
      ],
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return AppRouterScaffold(
          navigationShell: navigationShell,
          rootNavDestinations: ref.read(rootNavDestinationsProvider),
          //moreMenuDestinations: ref.read(moreMenuDestinationsProvider),
          bottomNavbarBuilder: AppBottomNavBar.new,
        );
      },
    ),
  ];

  return routesList;
}
