import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/realm/realm_config.dart';

class AddCaseButton extends ConsumerWidget {
  const AddCaseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        final realm = ref.read(realmProvider);
        final caseModel = CaseModelX.zero();
        realm.write(() {
          realm.add(caseModel);
        });
      },
      child: const Text('Add Case'),
    );
  }
}
