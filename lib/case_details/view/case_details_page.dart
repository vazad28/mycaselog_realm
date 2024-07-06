import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../case_details.dart';

class CaseDetailsPage extends ConsumerWidget
    with CaseDetailsEventMixin, CaseDetailsStateMixin {
  const CaseDetailsPage({super.key, required CaseModel caseModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(caseDetailsNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CaseDetailsScreen'),
      ),
      body: const CaseDetailsView(),
    );
  }
}
