import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CasesCountWidget extends ConsumerWidget {
  const CasesCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.watch(casesProvider).changes,
      builder: (_, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(right: AppSpacing.sm),
          child: Text(
            (snapshot.data?.results.length ?? 0).toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      },
    );
  }
}
