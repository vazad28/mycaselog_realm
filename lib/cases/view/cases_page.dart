import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesPage extends ConsumerWidget with CasesEventMixin, CasesStateMixin{
  const CasesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: CasesPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(casesNotifierProvider.notifier);
    

    return  Scaffold(
      appBar: AppBar(title: const Text('CasesScreen'),),
      body: const CasesView(),
    );
  }
}