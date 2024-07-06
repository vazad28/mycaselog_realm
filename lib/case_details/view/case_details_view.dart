import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../case_details.dart';

class CaseDetailsView extends ConsumerWidget with CaseDetailsEventMixin, CaseDetailsStateMixin{
  const CaseDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseDetailsAsync = ref.watch(caseDetailsNotifierProvider);

    return const Center(child: Text('CaseDetailsView'));
  }
}