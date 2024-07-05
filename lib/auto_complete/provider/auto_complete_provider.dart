import 'package:app_data/app_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/auto_complete/provider/auto_complete_provider.g.dart';

enum AutoCompleteType { all, surgery, diagnosis, icd, cpt }

enum AutoCompleteDataType { string, mapEntry }

/// type def
typedef MergeAutocomplete = void Function(String, String);

@riverpod
class AutoCompleteNotifier extends _$AutoCompleteNotifier {
  late final AppData _appData;
  @override
  FutureOr<List<String>> build() {
    _appData = ref.watch(appDataProvider);
    return [];
  }

  Future<List<String>> diagnosisAutoComplete(String? query) {
    return _appData.databaseService.casesCollection
        .getAutoCompleteDiagnosis(query);
  }

  Future<List<String>> surgeryAutoComplete(String? query) {
    return _appData.databaseService.casesCollection
        .getAutoCompleteSurgery(query);
  }
}