import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../../../router/routes/routes.dart';
import '../../../../support_data.dart';

class AssistantsPage extends ConsumerWidget with AssistantsEventMixin {
  const AssistantsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: AssistantsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).assistants.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              AddAssistantRoute(AssistantModel.zero(), newRecord: true)
                  .push<AssistantModel>(context);
            },
          ),
        ],
      ),
      body: const AssistantsView(),
    );
  }
}
