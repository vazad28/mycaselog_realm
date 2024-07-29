import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../case_timeline/case_timeline.dart';
import '../../core/core.dart';

part '../../generated/case_pdf/provider/case_pdf_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Model classes
/// ////////////////////////////////////////////////////////////////////
class CasePdfModel {
  CasePdfModel({
    required this.caseModel,
    required this.timelines,
    this.pdfFile,
  });

  final CaseModel? caseModel;
  final List<TimelineItemPdf>? timelines;
  final File? pdfFile;
}

class TimelineItemPdf {
  TimelineItemPdf({
    required this.mediaFiles,
    required this.notes,
    this.eventDate,
  });

  final String? eventDate;
  final List<File?> mediaFiles;
  final List<String?> notes;
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class CasePdfNotifier extends _$CasePdfNotifier with LoggerMixin {
  @override
  AsyncValue<CasePdfModel> build(String caseID, ThemeData themeData) {
    _createPdfData();
    return const AsyncLoading();
  }

  Future<List<File?>> mediaFiles(List<MediaModel> mediaList) async {
    final mediaFiles = <File?>[];
    for (final mediaModel in mediaList) {
      final photoUri =
          mediaModel.thumbUri ?? mediaModel.mediumUri ?? mediaModel.fileUri;

      if (photoUri == null) continue;

      final mngr =
          MediaCacheManager(photoUri).cacheManager ?? AppCacheManager.instance;

      final file = await mngr.getSingleFile(photoUri);
      mediaFiles.add(file);
    }
    return mediaFiles;
  }

  Future<void> _createPdfData() async {
    final caseModelManaged =
        ref.watch(dbProvider).casesCollection.getSingle(caseID);

    if (caseModelManaged == null) {
      throw Exception('Case not found in database');
    }

    final caseModel = caseModelManaged.toUnmanaged();

    try {
      /// get timeline items
      final timelineItems = ref.watch(caseTimelineProvider(caseModel));

      /// create a  simple list of timelines for PDF generation
      final timelines = <TimelineItemPdf>[];

      for (final e in timelineItems) {
        /// get data for timeline
        final notes = e.noteList.map((noteModel) => noteModel.note).toList();
        final medias = await mediaFiles(e.mediaList);

        /// if the timeline has no media and no note either done add it
        if (notes.isEmpty && medias.isEmpty) continue;
        timelines.add(
          TimelineItemPdf(
            mediaFiles: medias,
            notes: notes,
            eventDate: e.eventDate,
          ),
        );
      }

      final dir = (await getTemporaryDirectory()).path;
      final path = '$dir/${caseModel.caseID}.pdf';

      final casePdfModel = CasePdfModel(
        caseModel: caseModel,
        timelines: timelines,
        pdfFile: File(path),
      );

      state = AsyncData(casePdfModel);
    } catch (err) {
      throw err.toAppFailure();
    }
  }
}
