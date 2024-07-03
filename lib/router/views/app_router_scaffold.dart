// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

typedef BottomNavbarBuilder = Widget Function(NavigationBar navigationBar);

/// Creates a basic adaptive page with navigational elements and a body using
/// [AdaptiveLayout].
class AppRouterScaffold extends StatelessWidget {
  const AppRouterScaffold({
    required this.navigationShell,
    required this.rootNavDestinations,
    required this.bottomNavbarBuilder,
    this.leading,
    super.key,
  });
  //final Widget body;
  final StatefulNavigationShell navigationShell;
  final Widget? leading;
  final BottomNavbarBuilder bottomNavbarBuilder;
  final List<NavigationDestination> rootNavDestinations;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (BuildContext context, Widget? child) {
        final currentNavBarTheme = NavigationBarTheme.of(context);

        final bottomNavbar = NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: rootNavDestinations,
          onDestinationSelected: navigationShell.goBranch,
        );

        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBarTheme(
            data: currentNavBarTheme.copyWith(
              iconTheme:
                  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
                return currentNavBarTheme.iconTheme
                        ?.resolve(states)
                        ?.copyWith(size: 24) ??
                    IconTheme.of(context).copyWith(size: 24);
              }),
            ),
            child: bottomNavbarBuilder(bottomNavbar),
          ),
        );
      },
      medium: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: navigationShell.currentIndex,
                // ignore: avoid_redundant_argument_values
                extended: false,
                destinations: rootNavDestinations
                    .map(AdaptiveScaffold.toRailDestination)
                    .toList(),
                onDestinationSelected: navigationShell.goBranch,
              ),
              Expanded(
                child: navigationShell,
              ),
            ],
          ),
        );
      },
      large: (BuildContext context, Widget? child) {
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: navigationShell.currentIndex,
                extended: true,
                destinations: rootNavDestinations
                    .map(AdaptiveScaffold.toRailDestination)
                    .toList(),
                onDestinationSelected: navigationShell.goBranch,
              ),
              Expanded(
                child: navigationShell,
              ),
            ],
          ),
        );
      },
    );
  }
}
