import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';

part '../../generated/auto_complete/provider/auto_complete_provider.g.dart';

enum AutoCompleteType { all, surgery, diagnosis, icd, cpt }

enum AutoCompleteDataType { string, mapEntry }

/// type def
typedef MergeAutocomplete = void Function(String, String);

@riverpod
class AutoCompleteNotifier extends _$AutoCompleteNotifier {
  @override
  FutureOr<List<String>> build() {
    return [];
  }

  Future<List<String>> diagnosisAutoComplete(String? query) {
    return ref
        .watch(dbProvider)
        .casesCollection
        .getAutoCompleteDiagnosis(query);
  }

  Future<List<String>> surgeryAutoComplete(String? query) {
    return ref.watch(dbProvider).casesCollection.getAutoCompleteSurgery(query);
  }
}
