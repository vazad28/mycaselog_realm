import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_data/app_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:share_plus/share_plus.dart';

import '../router/router.dart';
import '../support_data/provider/support_data_provider.dart';
import 'providers/providers.dart';

mixin AppMixins {
  /// ////////////////////////////////////////////////////////////////////
  /// Collections Mixins
  /// ////////////////////////////////////////////////////////////////////
  StorageCollection storageCollection(WidgetRef ref) =>
      ref.watch(dbProvider).storageCollection;

  MediaCollection mediaCollection(WidgetRef ref) =>
      ref.watch(dbProvider).mediaCollection;

  CasesCollection casesCollection(WidgetRef ref) =>
      ref.watch(dbProvider).casesCollection;

  SettingsCollection settingsCollection(WidgetRef ref) =>
      ref.watch(dbProvider).settingsCollection;

  SupportDataCollection supportDataCollection(WidgetRef ref) =>
      ref.watch(dbProvider).supportDataCollection;

  /// ////////////////////////////////////////////////////////////////////
  /// Show hide bottom nav bar Mixins
  /// ////////////////////////////////////////////////////////////////////
  void showBottomNavbar(WidgetRef ref) {
    if (!ref.read(bottomNavVisibilityProvider)) {
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: true);
    }
  }

  void hideBottomNavbar(WidgetRef ref) {
    if (ref.read(bottomNavVisibilityProvider)) {
      ref.watch(bottomNavVisibilityProvider.notifier).update(value: false);
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Media Mixins
  /// ////////////////////////////////////////////////////////////////////
  /// share Media List
  Future<void> shareMedia(
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

  /// delete case media
  Future<void> deleteMedia(
    WidgetRef ref,
    MediaModel mediaModel,
  ) async {
    try {
      /// delete media from storage
      await storageCollection(ref).deleteMedia(mediaModel);
    } on FirebaseException catch (error) {
      debugPrint(error.toString());
    } finally {
      /// delete from firestore because we need to make sure the error deleting
      /// files does not compromise this part
      await ref
          .watch(dbProvider)
          .mediaCollection
          .upsert(() => mediaModel..removed = 1);
    }
  }

  void retryMediaUpload(WidgetRef ref, MediaModel mediaModel) {
    mediaCollection(ref)
        .addMedia(mediaModel.toUnmanaged()..status = MediaStatus.queued);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Support data Mixins
  /// ////////////////////////////////////////////////////////////////////

  /// get support data
  SupportDataModel getSupportData(WidgetRef ref) =>
      supportDataCollection(ref).getSupportData() ??
      SupportDataModelX.zero(ref.watch(userIDProvider));

  List<T> supportDataSelect<T>(
    WidgetRef ref,
    List<T> Function(SupportDataModel) selectCallback,
  ) =>
      ref.watch(supportDataNotifierProvider.select(selectCallback));

  List<ActivableCaseField> watchActiveFieldsList(WidgetRef ref) {
    return ref.watch(
      supportDataNotifierProvider.select((supportData) {
        if (supportData.activeBasicFields.isEmpty) {
          return ActivableCaseField.values;
        }

        return supportData.activeBasicFields
            .map((name) => ActivableCaseField.values.byName(name))
            .toList();
      }),
    );
  }

  /// Encrypt patient Model
  String encryptDecryptedPatientModel(
    WidgetRef ref,
    DecryptedPatientModel decryptedPatientModel,
  ) =>
      ref
          .watch(encryptPatientModelProvider(decryptedPatientModel))
          .when(success: (success) => success, failure: (f) => throw f);

  DecryptedPatientModel decryptPatientModel(WidgetRef ref, String crypt) => ref
      .watch(decryptPatientModelProvider(crypt))
      .when(success: (success) => success, failure: (f) => throw f);
}
