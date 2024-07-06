import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/realm/realm_config.dart';
import '../../core/services/services.dart';

part '../../generated/cases/provider/cases_provider.g.dart';
part 'cases_mixins.dart';

/// Total case count provider
@riverpod
class TotalCasesCount extends _$TotalCasesCount {
  @override
  FutureOr<int> build() {
    return ref.watch(casesRepositoryProvider).getTotalCaseCount();
  }
}

/// case tile style provider
@riverpod
class CaseTileStyle extends _$CaseTileStyle {
  @override
  int build() {
    final localStorage = ref.watch(localStorageProvider);
    return localStorage.getCaseListTileStyle();
  }

  // ignore: use_setters_to_change_properties
  void update(int toggledStyle) {
    state = toggledStyle;
    ref.read(localStorageProvider).setCaseListTileStyle(toggledStyle);
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@Riverpod(keepAlive: true)
class CasesNotifier extends _$CasesNotifier with LoggerMixin {
  //StreamSubscription<List<CaseModel>>? subscription;

  final scrollController = ScrollController();

  @override
  RealmResults<CaseModel> build() {
    //final casesCollection = ref.watch(databaseServiceProvider).casesCollection;

    //subscription = casesCollection.listenForChanges().listen((documents) {
    // Handle document changes (added, modified)
    // for (final document in documents) {
    //   print('new data  should be painted');
    //   state = loadCases();
    // }
    //});

    ref.onDispose(() {
      logger.fine('cases notifier dispose called');
      //subscription?.cancel();
    });

    return loadCases();
  }

  RealmResults<CaseModel> loadCases() {
    return ref.read(casesRepositoryProvider).loadCases();
    // final realm = ref.read(realmProvider);
    // final cases = realm.all<CaseModel>();
    // print('There are ${cases.length} cases.');
    // return cases;
  }

  Future<void> addCase() async {
    try {
      final caseModel = CaseModelX.zero();
      await ref.read(casesRepositoryProvider).addCase(caseModel);
      // } on RepositoryFailure (f){
      //   logger.severe(f.toString());
    } catch (err) {
      logger.severe(err.toString());
    }
  }

  void clearCases() {
    final realm = ref.read(realmProvider);
    realm.write(() {
      try {
        realm.deleteAll<CaseModel>();
      } catch (err) {
        logger.fine(err.toString());
      }
    });
  }

  Future<void> pullToRefresh() async {}

  List<MediaModel> getCaseMedia(String caseID) {
    return ref.read(mediaRepositoryProvider).getCaseMedia(caseID);
  }
}
