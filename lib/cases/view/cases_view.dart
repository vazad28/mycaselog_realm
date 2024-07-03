import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesView extends ConsumerWidget with CasesEventMixin, CasesStateMixin{
  const CasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casesAsync = ref.watch(casesNotifierProvider);

    return const Center(child: Text('CasesView'));
  }
}