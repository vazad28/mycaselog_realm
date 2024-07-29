import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/core.dart';
import '../../router/routes/notes_routes.dart';
import '../notes.dart';

class NotesPage extends ConsumerStatefulWidget {
  const NotesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesPageState();
}

class _NotesPageState extends ConsumerState<NotesPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('__notes_page_scaffold_key__'),
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        surfaceTintColor: context.colorScheme.surfaceTint,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: const [
          NotesAppBar(),
          SliverPadding(
            padding: EdgeInsets.all(AppSpacing.sm),
            sliver: _NotesView(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        _scrollController,
        key: const Key('__notes_page_fab_key__'),
        title: S.of(context).addNote,
        onTap: () {
          AddNoteRoute().push<void>(context);
        },
      ),
    );
  }
}

class _NotesView extends ConsumerWidget {
  const _NotesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueSliverWidget<RealmResultsChanges<NoteModel>>(
      key: key,
      value: ref.watch(notesNotifierProvider),
      data: (data) {
        return NotesView(
          noteModels: data.results,
        );
      },
    );
  }
}
