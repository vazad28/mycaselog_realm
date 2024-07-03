import 'package:flutter/material.dart';

enum RouteStatus { pushed, popped, pushedNext, poppedNext }

class BottomNavbarAwareWrapper extends StatefulWidget {
  const BottomNavbarAwareWrapper({
    required this.child,
    required this.onRouteStatus,
    required this.routeObserver,
    super.key,
  });

  final Widget child;
  // ignore: avoid_positional_boolean_parameters
  final void Function(RouteStatus status) onRouteStatus;
  final RouteObserver<ModalRoute<void>> routeObserver;

  @override
  State<BottomNavbarAwareWrapper> createState() => _RouteAwareWrapperState();
}

class _RouteAwareWrapperState extends State<BottomNavbarAwareWrapper>
    with RouteAware {
  late RouteObserver<ModalRoute<void>> _routeObserver;

  @override
  void initState() {
    _routeObserver = widget.routeObserver;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  /// --- show or hide the bottom nav bar
  void _showBootomBarNav(RouteStatus routeStatus) {
    Future<void>.delayed(Duration.zero).then(
      (value) => widget.onRouteStatus.call(routeStatus),
    );
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Route Aware
  /// ////////////////////////////////////////////////////////////////////
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  // Route was pushed onto the navigator.
  @override
  void didPush() {
    _showBootomBarNav(RouteStatus.pushed);
    super.didPush();
  }

  // Route was popped off the navigator.
  @override
  void didPopNext() {
    _showBootomBarNav(RouteStatus.poppedNext);
    super.didPopNext();
  }

  @override
  void didPushNext() {
    _showBootomBarNav(RouteStatus.pushedNext);
    super.didPushNext();
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }
}
