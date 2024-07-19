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
    return ref.watch(collectionsProvider).casesCollection.getAll();
  }

  Future<void> pullToRefresh() async {}
}

// final casesNotifierProvider = StateProvider<CasesState>((ref) {
//   return CasesState(ref);
// });

// class CasesState extends StateNotifier<Iterable<Conversation>> {
//   CasesState(Ref ref) : super([]) {
//     _listenToChanges(ref);
//   }

//   void _listenToChanges(Ref ref) {
//     final results = ref.read(collectionsProvider).conversationCollection.getAll();
//     results.changes.listen((changes) {
//       // Update state based on changes
//       state = changes.results;
//     });
//   }
// }

// final casesStreamProvider = StreamProvider<Iterable<Conversation>>((ref) {
//   return ref.watch(casesNotifierProvider).stream;
// });
