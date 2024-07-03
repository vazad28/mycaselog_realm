import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notes.dart';

class NotesView extends ConsumerWidget with NotesEventMixin, NotesStateMixin{
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(notesNotifierProvider);

    return const Center(child: Text('NotesView'));
  }
}