import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notes.dart';

class NotesCountWidget extends ConsumerWidget {
  const NotesCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(notesProvider).changes,
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
