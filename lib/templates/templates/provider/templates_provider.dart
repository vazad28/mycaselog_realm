import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../../core/providers/providers.dart';
import 'templates_event.dart';

part '../../../generated/templates/templates/provider/templates_provider.g.dart';
part 'templates_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
/// Flag to show only active templates or all templates
final showActiveTemplatesProvider =
    StateProvider.autoDispose<bool>((ref) => true);

@riverpod
class TemplatesNotifier extends _$TemplatesNotifier with LoggerMixin {
  @override
  StateOf<List<TemplateModel>> build() {
    /// load templates on init of provider
    Future<void>.delayed(const Duration(milliseconds: 300)).then((_) {
      _loadTemplates();
    });
    return const StateOf<List<TemplateModel>>.init();
  }

  final templatesListScrollController = ScrollController();

  /// Map events to state
  Future<void> on(TemplatesEvent event) async {
    event.map(
      deactivateTemplate: (value) =>
          _updateTemplate(value.templateModel..removed = 2),
      deleteTemplate: (value) =>
          _updateTemplate(value.templateModel..removed = 1),
      reactivateTemplate: (value) =>
          _updateTemplate(value.templateModel..removed = 0),
      shareTemplate: (value) =>
          _updateTemplate(value.templateModel..shared = true),
      unShareTemplate: (value) =>
          _updateTemplate(value.templateModel..shared = false),
      refreshTemplates: (value) => _loadTemplates(),
    );
  }

  Future<void> _loadTemplates() async {
    final result =
        await ref.read(templatesRepositoryProvider).getAllTemplates();
    state = StateOf<List<TemplateModel>>.success(result);

    // result.when(
    //   success: (templates) {
    //     state = StateOf<List<TemplateModel>>.success(templates);
    //   },
    //   failure: (failure) {
    //     state = StateOf<List<TemplateModel>>.failure(failure);
    //   },
    // );
  }

  void _updateTemplate(TemplateModel templateModel) {
    ref
        .watch(templatesRepositoryProvider)
        .updateTemplate(templateModel)
        .then((value) {
      value.when(
        success: (_) => _loadTemplates(),
        failure: (f) => state = StateOf<List<TemplateModel>>.failure(f),
      );
    });
  }
}
