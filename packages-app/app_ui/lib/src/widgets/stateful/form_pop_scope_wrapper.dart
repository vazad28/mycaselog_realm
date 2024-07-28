import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';

typedef CanPop = bool Function();

class FormPopScopeWrapper extends StatefulWidget {
  const FormPopScopeWrapper({
    required this.child,
    required this.canPop,
    required this.visibilitySwitcher,
    required this.routeObserver,
    super.key,
    this.warningText,
  });

  final Widget child;
  final CanPop canPop;
  final String? warningText;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool visibility) visibilitySwitcher;
  final RouteObserver<ModalRoute<void>> routeObserver;

  @override
  State<FormPopScopeWrapper> createState() => _FormPopScopeWrapperState();
}

class _FormPopScopeWrapperState extends State<FormPopScopeWrapper>
    with RouteAware {
  bool _canPop = false;

  late RouteObserver<ModalRoute<void>> _routeObserver;

  @override
  void initState() {
    _routeObserver = widget.routeObserver;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          _showBootomBarNav(true);
          return;
        }

        /// bool value returned by function in parent logic for can pop
        _canPop = widget.canPop();

        /// if can pop, call the pop now with local variable set to true
        if (_canPop) {
          Navigator.of(context).pop();
          return;
        }

        /// Pop is denied as _canPop is false.
        /// Ask user if the means to pop and if yes we do it
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            showDialog<bool>(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  content: Text(
                    widget.warningText ?? S.of(context).unSavedFormWarning,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              },
            ).then((res) {
              if (res == null || res == false) return;

              _canPop = res;
              if (context.mounted) Navigator.of(context).pop();
            });
          },
        );
      },
      child: widget.child,
    );
  }

  /// --- show or hide the bottom nav bar
  void _showBootomBarNav(bool visibility) {
    Future<void>.delayed(Duration.zero).then(
      (value) => widget.visibilitySwitcher.call(visibility),
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
    _showBootomBarNav(false);
    super.didPush();
  }

  // Route was popped off the navigator.
  @override
  void didPop() {
    _showBootomBarNav(true);
    super.didPop();
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }
}
