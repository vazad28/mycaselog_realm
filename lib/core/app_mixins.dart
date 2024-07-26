import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_repositories/app_repositories.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:realm/realm.dart';
import 'package:share_plus/share_plus.dart';

import '../settings/settings.dart';
import '../support_data/provider/support_data_provider.dart';
import 'app_providers.dart';
import 'app_services.dart';

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
          .upsert(mediaModel.mediaID, () => mediaModel..removed = 1);
    }
  }

  /// Refresh all Media Backlinks in Realm  database
  Future<void> refreshMediaBacklinks(WidgetRef ref) async {
    try {
      return ref.watch(dbProvider).mediaCollection.refreshMediaBacklinks();
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('Refresh failed');
      return;
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Cases Mixins
  /// ////////////////////////////////////////////////////////////////////
  /// delete case media
  Future<void> deleteCase(
    WidgetRef ref,
    CaseModel caseModel,
  ) async {
    try {
      /// delete media from storage
      for (final mediaModel in caseModel.medias) {
        await storageCollection(ref).deleteMedia(mediaModel);
      }
    } on FirebaseException catch (error) {
      debugPrint(error.toString());
    } finally {
      /// delete from firestore because we need to make sure the error deleting
      /// files does not compromise this part and also we can  not reference a file
      /// if the ref object is removed from tree if we delete caseModel itself first
      await casesCollection(ref)
          .upsert(caseModel.caseID, () => caseModel..removed = 1);
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Settings Mixin
  /// ////////////////////////////////////////////////////////////////////

  /// get settings
  // SettingsModel getSettings(WidgetRef ref) =>
  //     settingsCollection(ref).getSettings();

  /// ////////////////////////////////////////////////////////////////////
  /// SupportData
  /// ////////////////////////////////////////////////////////////////////
  /// get support data
  SupportDataModel getSupportData(WidgetRef ref) =>
      supportDataCollection(ref).getSupportData();

  /// support data selector watcher
  // T watchSupportDataSelect<T>(
  //   WidgetRef ref,
  //   T Function(SupportDataModel supportData) selectCallback,
  // ) {
  //   return ref.watch(supportDataNotifierProvider.select(selectCallback));
  // }

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
}
