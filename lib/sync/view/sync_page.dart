import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sync.dart';

/// this page fails if using stateful... go figure
class SyncPage extends ConsumerWidget {
  const SyncPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SyncPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      extendBody: true,
      body: SyncView(),
    );
  }
}
