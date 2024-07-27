import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';
import '../../core/app_services.dart';

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
class CasesNotifier extends _$CasesNotifier {
  @override
  Stream<RealmResultsChanges<CaseModel>> build() {
    return ref.read(dbProvider).casesCollection.getAll().changes;
  }

  Future<void> pullToRefresh() {
    try {
      return ref.watch(dbProvider).casesCollection.refreshCasesBacklinks(null);
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('Refresh failed');
      return Future<void>.sync(() => {});
    }
  }
}
