import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../sync.dart';

class SyncView extends StatelessWidget {
  const SyncView({super.key});

  /// divider
  Divider get _divider => const Divider(indent: 24, height: 1);

  @override
  Widget build(BuildContext context) {
    final child = ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: Text(
            'Sync Data',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),

        const _TableToSync<CaseModel>(
          DbCollection.cases,
        ), //cases
        _divider,
        const _TableToSync<MediaModel>(
          DbCollection.media,
        ), //media
        _divider,
        const _TableToSync<TemplateModel>(
          DbCollection.templates,
        ), // templates
        _divider,
        const _TableToSync<TimelineNoteModel>(
          DbCollection.timelineNotes,
        ), // timeline notes
        _divider,
        // const _TableToSync<NoteModel>(
        //   DbCollection.notes,
        // ), // timeline notes
        // _divider,
        const _TableToSync<SupportDataModel>(
          DbCollection.supportData,
        ), // support data
        _divider,
        const SizedBox(height: AppSpacing.xlg),
        const Center(child: SyncDoneButton()),
      ],
    );

    return Center(child: child);
  }
}

class _TableToSync<T> extends StatelessWidget {
  const _TableToSync(this.dbCollection, {super.key});
  final DbCollection dbCollection;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: SyncItemTile<T>(dbCollection),
    );
  }
}
