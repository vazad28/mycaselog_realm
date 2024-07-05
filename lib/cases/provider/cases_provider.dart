import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/realm/realm_config.dart';

part '../../generated/cases/provider/cases_provider.freezed.dart';
part '../../generated/cases/provider/cases_provider.g.dart';
part 'cases_mixins.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@Riverpod(keepAlive: true)
class CasesNotifier extends _$CasesNotifier with LoggerMixin {
  StreamSubscription<List<CaseModel>>? subscription;

  final scrollController = ScrollController();

  @override
  RealmResults<CaseModel> build() {
    final casesCollection =
        ref.watch(appDataProvider).databaseService.casesCollection;

    subscription = casesCollection.listenForChanges().listen((documents) {
      // Handle document changes (added, modified)
      for (final document in documents) {
        print('new data  should be painted');
        state = loadCases();
      }
    });

    ref.onDispose(() {
      logger.fine('cases notifier dispose called');
      subscription?.cancel();
    });

    return loadCases();
  }

  RealmResults<CaseModel> loadCases() {
    final realm = ref.read(realmProvider);
    final cases = realm.all<CaseModel>();
    print('There are ${cases.length} cases.');
    return cases;
  }

  /// Map events to state
  void on(CasesEvent event) {
    event.map(addCases: (value) => {});
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
}
