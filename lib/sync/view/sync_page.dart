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
    return PopScope(
      child: const Material(child: SyncView()),
      onPopInvokedWithResult: (didPop, _) {
        showBottomNavbar(ref);
      },
    );
  }
}
