import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/case_details/provider/case_details_provider.g.dart';
part 'case_details_mixins.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

///  Case details seeder provider
final caseIDProvider = StateProvider.autoDispose<String?>((ref) => null);

@riverpod
class CaseDetailsNotifier extends _$CaseDetailsNotifier {
  @override
  AsyncValue<CaseModel> build() {
    final caseID = ref.watch(caseIDProvider);

    if (caseID == null) return const AsyncValue.loading();

    final sub = ref
        .watch(collectionsProvider)
        .casesCollection
        .getSingle(caseID)
        ?.changes
        .listen((data) {
      state = AsyncValue.data(data.object);
    });

    ref.onDispose(() => sub?.cancel());

    return const AsyncValue.loading();
  }
}

@riverpod
AsyncValue<TemplateModel?> caseDetailsTemplateModel(
  CaseDetailsTemplateModelRef ref,
) {
  final caseModelAsync = ref.watch(caseDetailsNotifierProvider);

  final caseModel = caseModelAsync.value;
  if (caseModel == null) return const AsyncLoading();
  if (caseModel.templateID == null) return const AsyncValue.data(null);

  final templateModel = ref
      .watch(collectionsProvider)
      .templatesCollection
      .getSingle(caseModel.templateID!);

  if (templateModel == null) {
    return AsyncError('Missing template for ID', StackTrace.current);
  }

  return AsyncValue.data(templateModel);
}
