import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../sync/sync.dart';

part '../../generated/cases/provider/cases_provider.g.dart';

/// case tile style provider
@riverpod
class CaseTileStyle extends _$CaseTileStyle {
  @override
  int build() {
    return ref.watch(localStorageProvider).getCaseListTileStyle();
  }

  // ignore: use_setters_to_change_properties
  void update(int toggledStyle) {
    state = toggledStyle;
    ref.read(localStorageProvider).setCaseListTileStyle(toggledStyle);
  }
}

/// Cases  stream  provider
@Riverpod(keepAlive: true)
class CasesNotifier extends _$CasesNotifier with LoggerMixin {
  @override
  Stream<RealmResultsChanges<CaseModel>> build() {
    /// Listen for settings provider to start or stop firebse sync
    ref.listen(firestoreLiveSyncProvider, (previous, next) {
      logger.fine('settingsNotifierProvider listening for sync');
    });

    return ref
        .watch(dbProvider)
        .casesCollection
        .getAll(orderByField: BasicDataModelProps.surgeryDate.name)
        .changes;
  }

  /// Full text search cases
  RealmResults<CaseModel> searchCases(String searchTerm) {
    return ref.watch(dbProvider).casesCollection.search(searchTerm);
  }

  Future<void> pullToRefresh() {
    try {
      return Future<void>.delayed(const Duration(milliseconds: 1600)).then((_) {
        return ref.watch(dbProvider).casesCollection.refreshBacklinks();
      });
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('Refresh failed');
      return Future<void>.sync(() => {});
    }
  }

  // void _checkSyncOnStart() {
  //   // ignore: unused_local_variable
  //   final settingsModel =
  //       ref.watch(dbProvider).settingsCollection.getSettings();
  //   if (settingsModel?.syncOnStart ?? false) {}
  // }
}
