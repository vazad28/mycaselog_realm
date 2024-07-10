import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:flutter/widgets.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';

part '../../generated/cases/provider/cases_provider.g.dart';

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

@riverpod
class Cases extends _$Cases with LoggerMixin {
  final scrollController = ScrollController();

  @override
  RealmResults<CaseModel> build() {
    return ref.watch(dbProvider).casesCollection.getAll();
  }

  Future<void> pullToRefresh() async {}

  List<MediaModel> getCaseMedia(String caseID) {
    return ref.read(dbProvider).mediaCollection.getCaseMedia(caseID);
  }
}
