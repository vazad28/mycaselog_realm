import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import '../notes.dart';

class NotesCountWidget extends ConsumerWidget {
  const NotesCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(notesNotifierProvider),
      data: (data) {
        return RichText(
          text: TextSpan(
            text: 'Notes ',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(letterSpacing: -1),
            children: <TextSpan>[
              const TextSpan(text: ' '),
              TextSpan(
                text: data.results.length.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
