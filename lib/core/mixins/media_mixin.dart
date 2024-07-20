import 'dart:io';

import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../providers/providers.dart';

mixin MediaMixin {
  /// delete case media
  Future<void> deleteMedia(
    WidgetRef ref,
    MediaModel mediaModel,
  ) async {
    try {
      /// delete media from storage
      await ref
          .watch(collectionsProvider)
          .storageCollection
          .deleteMedia(mediaModel);
    } on FirebaseException catch (error) {
      debugPrint(error.toString());
    } finally {
      /// delete from firestore because we need to make sure the error deleting
      /// files does not compromise this part
      await ref
          .watch(collectionsProvider)
          .mediaCollection
          .upsert(mediaModel.mediaID, () => mediaModel..removed = 1);
    }
  }

  /// delete case media
  Future<void> shareMedia(
    WidgetRef ref,
    MediaModel mediaModel, {
    String? title,
  }) async {
    final File file =
        await AppCacheManager.instance.getSingleFile(mediaModel.mediumUri!);
    final xFile = XFile(file.path);
    await Share.shareXFiles(
      [xFile],
      subject: S.current.mediaShareSubjectLine,
      text: 'Share media',
    );
  }

  /// shareMedia List
  Future<void> shareMediaList(
    WidgetRef ref, {
    required List<MediaModel> mediaModels,
  }) async {
    final mediaFiles = await Future.wait(
      mediaModels.map((e) {
        return AppCacheManager.instance.getSingleFile(e.mediumUri!);
      }),
    );

    await Share.shareXFiles(
      mediaFiles.map((e) => XFile(e.path)).toList(),
      subject: S.current.mediaShareSubjectLine,
      text: 'Share media',
    );
  }
}
