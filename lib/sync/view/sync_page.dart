import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_mixins.dart';
import '../sync.dart';

class SyncPage extends ConsumerStatefulWidget {
  const SyncPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SyncPage());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SyncPageState();
}

class _SyncPageState extends ConsumerState<SyncPage> with AppMixins {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => hideBottomNavbar(ref));
  }

  @override
  Widget build(BuildContext context) {
    final widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          alignment: AlignmentDirectional.bottomCenter,
          child: Text(
            'Sync Data',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
          flex: 3,
          child: Center(
            child: SyncView(),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: AppSpacing.xlg),
          alignment: AlignmentDirectional.topCenter,
          child: const SyncDoneButton(),
        ),
        const Spacer(),
      ],
    );

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        showBottomNavbar(ref);
      },
      child: Material(
        child: widget.paddingSymmetric(vertical: 8, horizontal: 16),
      ),
    );
  }
}
