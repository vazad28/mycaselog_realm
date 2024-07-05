// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../support_data/features/anesthesia_blocks/provider/anesthesia_blocks_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnesthesiaBlocksEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnesthesiaBlock value) addAnesthesiaBlock,
    required TResult Function(_RemoveAnesthesiaBlock value)
        removeAnesthesiaBlock,
    required TResult Function(_UpdateAnesthesiaBlocks value)
        updateAnesthesiaBlocks,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$AddAnesthesiaBlockImpl implements _AddAnesthesiaBlock {
  const _$AddAnesthesiaBlockImpl(this.block);

  @override
  final String block;

  @override
  String toString() {
    return 'AnesthesiaBlocksEvent.addAnesthesiaBlock(block: $block)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnesthesiaBlock value) addAnesthesiaBlock,
    required TResult Function(_RemoveAnesthesiaBlock value)
        removeAnesthesiaBlock,
    required TResult Function(_UpdateAnesthesiaBlocks value)
        updateAnesthesiaBlocks,
  }) {
    return addAnesthesiaBlock(this);
  }
}

abstract class _AddAnesthesiaBlock implements AnesthesiaBlocksEvent {
  const factory _AddAnesthesiaBlock(final String block) =
      _$AddAnesthesiaBlockImpl;

  String get block;
}

/// @nodoc

class _$RemoveAnesthesiaBlockImpl implements _RemoveAnesthesiaBlock {
  const _$RemoveAnesthesiaBlockImpl(this.block);

  @override
  final String block;

  @override
  String toString() {
    return 'AnesthesiaBlocksEvent.removeAnesthesiaBlock(block: $block)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnesthesiaBlock value) addAnesthesiaBlock,
    required TResult Function(_RemoveAnesthesiaBlock value)
        removeAnesthesiaBlock,
    required TResult Function(_UpdateAnesthesiaBlocks value)
        updateAnesthesiaBlocks,
  }) {
    return removeAnesthesiaBlock(this);
  }
}

abstract class _RemoveAnesthesiaBlock implements AnesthesiaBlocksEvent {
  const factory _RemoveAnesthesiaBlock(final String block) =
      _$RemoveAnesthesiaBlockImpl;

  String get block;
}

/// @nodoc

class _$UpdateAnesthesiaBlocksImpl implements _UpdateAnesthesiaBlocks {
  const _$UpdateAnesthesiaBlocksImpl(final List<String> blocks)
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
    return 'AnesthesiaBlocksEvent.updateAnesthesiaBlocks(blocks: $blocks)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAnesthesiaBlock value) addAnesthesiaBlock,
    required TResult Function(_RemoveAnesthesiaBlock value)
        removeAnesthesiaBlock,
    required TResult Function(_UpdateAnesthesiaBlocks value)
        updateAnesthesiaBlocks,
  }) {
    return updateAnesthesiaBlocks(this);
  }
}

abstract class _UpdateAnesthesiaBlocks implements AnesthesiaBlocksEvent {
  const factory _UpdateAnesthesiaBlocks(final List<String> blocks) =
      _$UpdateAnesthesiaBlocksImpl;

  List<String> get blocks;
}
