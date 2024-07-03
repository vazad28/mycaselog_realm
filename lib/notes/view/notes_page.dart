import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notes.dart';

class NotesPage extends ConsumerWidget with NotesEventMixin, NotesStateMixin{
  const NotesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: NotesPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(notesNotifierProvider.notifier);
    

    return  Scaffold(
      appBar: AppBar(title: const Text('NotesScreen'),),
      body: const NotesView(),
    );
  }
}