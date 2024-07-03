import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/router/providers/router_observers.g.dart';

class RoutesObservers {
  RoutesObservers()
      : casesRouteObserver = RouteObserver<ModalRoute<void>>(),
        mediaRouteObserver = RouteObserver<ModalRoute<void>>(),
        notesRouteObserver = RouteObserver<ModalRoute<void>>(),
        statsRouteObserver = RouteObserver<ModalRoute<void>>(),
        settingsRouteObserver = RouteObserver<ModalRoute<void>>(),
        menuRouteObserver = RouteObserver<ModalRoute<void>>() {
    debugPrint('OBSERVERS CREATED');
  }

  final RouteObserver<ModalRoute<void>> casesRouteObserver;
  final RouteObserver<ModalRoute<void>> mediaRouteObserver;
  final RouteObserver<ModalRoute<void>> notesRouteObserver;
  final RouteObserver<ModalRoute<void>> statsRouteObserver;
  final RouteObserver<ModalRoute<void>> settingsRouteObserver;
  final RouteObserver<ModalRoute<void>> menuRouteObserver;
}

/// Important to keep alive else a new instance of the observer is creared
/// and the didPop will not be called on route aware pages
@Riverpod(keepAlive: true)
RoutesObservers shellRoutesObservers(
  ShellRoutesObserversRef ref,
) {
  return RoutesObservers();
}

extension RouteObserverExtension on RouteObserver {
  void popUntil(String routeName) {
    // ignore: unnecessary_this
    this.navigator?.popUntil((route) {
      return route.settings.name == routeName;
    });
  }
}
