import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../core/providers/providers.dart';
import '../../index.dart';

part '../../../generated/templates/shared_templates/provider/shared_templates_provider.g.dart';

@riverpod
class SharedTemplatesNotifier extends _$SharedTemplatesNotifier
    with LoggerMixin {
  @override
  StateOf<List<SharedTemplateModel>> build(String? speciality) {
    loadSharedTemplates(speciality);
    return const StateOf<List<SharedTemplateModel>>.init();
  }

  Future<void> loadSharedTemplates(String? speciality) async {
    if (speciality == null) return;

    final result = await ref
        .watch(templatesRepositoryProvider)
        .getAllSharedTemplates(speciality);

    state = result.when(
      failure: StateOf<List<SharedTemplateModel>>.failure,
      success: StateOf<List<SharedTemplateModel>>.success,
    );
  }

  /// Import a template
  void importSharedTemplate(
    SharedTemplateModel sharedTemplateModel,
  ) {
    // try {
    final timestamp = ModelUtils.getTimestamp;

    final json = sharedTemplateModel.toJson();
    //print(json);

    final templateModel = TemplateModelX.fromJson(json)
      ..templateID = ModelUtils.uniqueID
      ..title = '${sharedTemplateModel.title} - imported'
      ..desc = sharedTemplateModel.desc ?? 'No description'
      ..shared = false
      ..createdAt = timestamp
      ..timestamp = timestamp;

    ref
        .watch(addTemplateSeederProvider.notifier)
        .seedWithImportedTemplate(templateModel);

    //   await Future<void>.delayed(Durations.medium1);
    //   return templateModel.templateID;
    // } catch (err) {
    //   return null;
    // }
  }
}

@riverpod
class SharedTemplateNotifier extends _$SharedTemplateNotifier {
  @override
  StateOf<String> build() {
    return const StateOf<String>.init();
  }

  /// Import a template
  Future<void> importSharedTemplate(
    SharedTemplateModel sharedTemplateModel,
  ) async {
    final timestamp = ModelUtils.getTimestamp;

    final templateModel = TemplateModelX.fromJson(sharedTemplateModel.toJson())
      ..templateID = ModelUtils.uniqueID
      ..title = '${sharedTemplateModel.title} - imported'
      ..desc = sharedTemplateModel.desc ?? 'No description'
      ..shared = false
      ..createdAt = timestamp
      ..timestamp = timestamp;

    ref
        .watch(addTemplateSeederProvider.notifier)
        .seedWithImportedTemplate(templateModel);

    state = StateOf.success(templateModel.templateID);
  }
}
