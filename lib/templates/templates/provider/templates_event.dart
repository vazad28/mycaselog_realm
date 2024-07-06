import 'package:app_models/app_models.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/templates/templates/provider/templates_event.freezed.dart';

/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class TemplatesEvent with _$TemplatesEvent {
  const factory TemplatesEvent.deactivateTemplate(
    TemplateModel templateModel,
  ) = _DeactivateTemplate;

  const factory TemplatesEvent.deleteTemplate(
    TemplateModel templateModel,
  ) = _DeleteTemplate;

  const factory TemplatesEvent.reactivateTemplate(
    TemplateModel templateModel,
  ) = _ReactivateTemplate;

  const factory TemplatesEvent.refreshTemplates() = _RefreshTemplates;

  const factory TemplatesEvent.shareTemplate(
    TemplateModel templateModel,
  ) = _ShareTemplate;

  const factory TemplatesEvent.unShareTemplate(
    TemplateModel templateModel,
  ) = _UnShareTemplate;
}
