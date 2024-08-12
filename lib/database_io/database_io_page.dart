import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database_io.dart';

class DatabaseIoPage extends ConsumerStatefulWidget {
  const DatabaseIoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DatabaseIoPageState();
}

class _DatabaseIoPageState extends ConsumerState<DatabaseIoPage> {
  int _currentIndex = 0;
  bool _showHome = true;

  @override
  Widget build(BuildContext context) {
    return _DatabaseIoViewWrapper(
      child: PageTransitionSwitcher(
        reverse: !_showHome,
        duration: Durations.long2,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            fillColor: Colors.transparent,
            child: child,
          );
        },
        child: _showHome
            ? _DatabaseIoView(onSelection: _onSelection)
            : _currentIndex == 0
                ? DatabaseImportView(onCancel: _goHome)
                : DatabaseExportView(onCancel: _goHome),
      ),
    );
  }

  void _onSelection(int index) {
    setState(() {
      _showHome = false;
      _currentIndex = index;
    });
  }

  void _goHome() => setState(() {
        _showHome = true;
      });
}

class _DatabaseIoView extends ConsumerWidget {
  const _DatabaseIoView({required this.onSelection});

  final void Function(int) onSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Select to import or export database'.hardcoded),
        VerticalSpacer.normal,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ref
                    .watch(databaseImportNotifierProvider.notifier)
                    .importIsarFile();
                onSelection.call(0);
              },
              child: Text('Import data'.hardcoded),
            ),
            HorizontalSpacer.large,
            ElevatedButton(
              onPressed: () {
                ref
                    .watch(databaseExportNotifierProvider.notifier)
                    .createIsarExportFile();
                onSelection.call(1);
              },
              child: Text('Export data'.hardcoded),
            ),
          ],
        ),
      ],
    );

    return child;
  }
}

class _DatabaseIoViewWrapper extends StatelessWidget {
  const _DatabaseIoViewWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Breakpoints.mobile,
          minHeight: 240,
          maxHeight: 240,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
      ),
    );
  }
}
