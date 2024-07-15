import 'dart:io';

import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_manager/media_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../../media_uploader/provider/media_uploader_provider.dart';
import '../providers/providers.dart';
import '../services/services.dart';

mixin MediaMixin {
  /// delete case media
  Future<void> deleteMedia(
    WidgetRef ref,
    MediaModel model,
  ) {
    return ref.watch(dbProvider).casesCollection.putMedia(model, delete: true);
  }

  /// delete case media
  Future<void> shareMedia(WidgetRef ref, MediaModel mediaModel,
      {String? title}) async {
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
    WidgetRef ref,
    List<MediaModel> mediaModels,
    String caseID,
  ) async {
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

  /// Add timeline image
  void addTimelinePhoto(WidgetRef ref, String caseID, ImageSource source) {
    MediaManager.imagePickerService
        .pickImage(source: source)
        .then((imageXFile) {
      ref.read(mediaUploader).uploadImage(
            imageFile: imageXFile,
            caseID: caseID,
          );
    }).catchError((err) {
      ref.read(dialogServiceProvider).showSnackBar('Failed to add image');
    });
  }
}
