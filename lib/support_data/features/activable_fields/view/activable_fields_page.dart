import 'package:app_annotations/app_annotations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../../../core/app_mixins.dart';
import '../../../support_data.dart';

part './activable_fields_view.dart';

class ActivableFieldsPage extends ConsumerWidget {
  const ActivableFieldsPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: ActivableFieldsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic data fields'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context
                  .showConfirmDialog(
                    'This action will reset selection of active fields and make all fields active',
                    title: 'Reset',
                  )
                  .then(
                    (res) => res
                        ? ref
                            .watch(supportDataNotifierProvider.notifier)
                            .upsertActivableCaseFields(null)
                        : null,
                  );
            },
            icon: const Icon(Icons.redo),
          ),
        ],
      ),
      body: const ActivableFieldsView(),
    );
  }
}
