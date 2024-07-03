import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stats.dart';

class StatsPage extends ConsumerWidget with StatsEventMixin, StatsStateMixin{
  const StatsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: StatsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(statsNotifierProvider.notifier);
    

    return  Scaffold(
      appBar: AppBar(title: const Text('StatsScreen'),),
      body: const StatsView(),
    );
  }
}