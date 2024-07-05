// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../support_data/provider/support_data_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupportDataEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateActivableFieldImpl implements _UpdateActivableField {
  const _$UpdateActivableFieldImpl(final List<ActivableAddCaseField> fields)
      : _fields = fields;

  final List<ActivableAddCaseField> _fields;
  @override
  List<ActivableAddCaseField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'SupportDataEvent.updateActivableFields(fields: $fields)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return updateActivableFields(this);
  }
}

abstract class _UpdateActivableField implements SupportDataEvent {
  const factory _UpdateActivableField(
      final List<ActivableAddCaseField> fields) = _$UpdateActivableFieldImpl;

  List<ActivableAddCaseField> get fields;
}

/// @nodoc

class _$UpdateAnesthesiaBlockImpl implements _UpdateAnesthesiaBlock {
  const _$UpdateAnesthesiaBlockImpl(final List<String> blocks)
      : _blocks = blocks;

  final List<String> _blocks;
  @override
  List<String> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'SupportDataEvent.updateAnesthesiaBlocks(blocks: $blocks)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return updateAnesthesiaBlocks(this);
  }
}

abstract class _UpdateAnesthesiaBlock implements SupportDataEvent {
  const factory _UpdateAnesthesiaBlock(final List<String> blocks) =
      _$UpdateAnesthesiaBlockImpl;

  List<String> get blocks;
}

/// @nodoc

class _$UpdateAssistantsImpl implements _UpdateAssistants {
  const _$UpdateAssistantsImpl(final List<AssistantModel> assistantModels)
      : _assistantModels = assistantModels;

  final List<AssistantModel> _assistantModels;
  @override
  List<AssistantModel> get assistantModels {
    if (_assistantModels is EqualUnmodifiableListView) return _assistantModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assistantModels);
  }

  @override
  String toString() {
    return 'SupportDataEvent.updateAssistants(assistantModels: $assistantModels)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return updateAssistants(this);
  }
}

abstract class _UpdateAssistants implements SupportDataEvent {
  const factory _UpdateAssistants(final List<AssistantModel> assistantModels) =
      _$UpdateAssistantsImpl;

  List<AssistantModel> get assistantModels;
}

/// @nodoc

class _$AddAssistantsImpl implements _AddAssistants {
  const _$AddAssistantsImpl(this.assistantModel);

  @override
  final AssistantModel assistantModel;

  @override
  String toString() {
    return 'SupportDataEvent.addAssistant(assistantModel: $assistantModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return addAssistant(this);
  }
}

abstract class _AddAssistants implements SupportDataEvent {
  const factory _AddAssistants(final AssistantModel assistantModel) =
      _$AddAssistantsImpl;

  AssistantModel get assistantModel;
}

/// @nodoc

class _$AddSurgeryLocationImpl implements _AddSurgeryLocation {
  const _$AddSurgeryLocationImpl(this.surgeryLocationModel);

  @override
  final SurgeryLocationModel surgeryLocationModel;

  @override
  String toString() {
    return 'SupportDataEvent.addSurgeryLocation(surgeryLocationModel: $surgeryLocationModel)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return addSurgeryLocation(this);
  }
}

abstract class _AddSurgeryLocation implements SupportDataEvent {
  const factory _AddSurgeryLocation(
          final SurgeryLocationModel surgeryLocationModel) =
      _$AddSurgeryLocationImpl;

  SurgeryLocationModel get surgeryLocationModel;
}

/// @nodoc

class _$UpdateSurgeryLocationsImpl implements _UpdateSurgeryLocations {
  const _$UpdateSurgeryLocationsImpl(
      final List<SurgeryLocationModel> surgeryLocations)
      : _surgeryLocations = surgeryLocations;

  final List<SurgeryLocationModel> _surgeryLocations;
  @override
  List<SurgeryLocationModel> get surgeryLocations {
    if (_surgeryLocations is EqualUnmodifiableListView)
      return _surgeryLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_surgeryLocations);
  }

  @override
  String toString() {
    return 'SupportDataEvent.updateSurgeryLocations(surgeryLocations: $surgeryLocations)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateActivableField value)
        updateActivableFields,
    required TResult Function(_UpdateAnesthesiaBlock value)
        updateAnesthesiaBlocks,
    required TResult Function(_UpdateAssistants value) updateAssistants,
    required TResult Function(_AddAssistants value) addAssistant,
    required TResult Function(_AddSurgeryLocation value) addSurgeryLocation,
    required TResult Function(_UpdateSurgeryLocations value)
        updateSurgeryLocations,
  }) {
    return updateSurgeryLocations(this);
  }
}

abstract class _UpdateSurgeryLocations implements SupportDataEvent {
  const factory _UpdateSurgeryLocations(
          final List<SurgeryLocationModel> surgeryLocations) =
      _$UpdateSurgeryLocationsImpl;

  List<SurgeryLocationModel> get surgeryLocations;
}
