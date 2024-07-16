import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../support_data/support_data.dart';

part '../../generated/case_details/provider/case_details_provider.g.dart';
part 'case_details_mixins.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

///  Case details seeder provider
final caseIDSeeder = StateProvider.autoDispose<String?>((ref) => null);

@riverpod
class CaseModelSeeder extends _$CaseModelSeeder {
  @override
  CaseModel? build() {
    final caseID = ref.watch(caseIDSeeder);

    if (caseID == null) return null;

    final sub = ref
        .watch(dbProvider)
        .casesCollection
        .getSingle(caseID)
        ?.changes
        .listen((data) {
      state = data.object;
    });

    ref.onDispose(() => sub?.cancel());

    return null;
  }
}

@riverpod
class CaseDetailsNotifier extends _$CaseDetailsNotifier {
  @override
  AsyncValue<CaseModel> build() {
    final caseModel = ref.watch(caseModelSeederProvider);
    if (caseModel != null) return AsyncValue.data(caseModel);

    return const AsyncValue.loading();
  }
}

@riverpod
AsyncValue<TemplateModel?> caseDetailsTemplateModel(
    CaseDetailsTemplateModelRef ref,) {
  final caseModelAsync = ref.watch(caseDetailsNotifierProvider);

  final caseModel = caseModelAsync.value;
  if (caseModel == null) return const AsyncLoading();
  if (caseModel.templateID == null) return const AsyncValue.data(null);

  final templateModel = ref
      .watch(dbProvider)
      .templatesCollection
      .getSingle(caseModel.templateID!);

  if (templateModel == null) {
    return AsyncError('Missing template for ID', StackTrace.current);
  }

  return AsyncValue.data(templateModel);
}
