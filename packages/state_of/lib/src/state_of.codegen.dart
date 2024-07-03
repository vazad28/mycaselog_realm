import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_of.codegen.freezed.dart';

class StateOfException implements Exception {}

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions(when: true, whenOrNull: false),
  map: FreezedMapOptions(map: true, maybeMap: false, mapOrNull: false),
)
class StateOf<T> with _$StateOf<T> {
  const StateOf._();

  const factory StateOf.init() = _init<T>;

  const factory StateOf.initialized([T? data]) = _initialized<T>;

  const factory StateOf.loading([String? message]) = _loading;

  const factory StateOf.success(T data) = _success<T>;

  const factory StateOf.failure(Exception e) = _failure;

  const factory StateOf.cancelled() = _cancelled<T>;

  /// Get type of state
  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: (_) => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);

  bool get isFailure => maybeWhen(failure: (_) => true, orElse: () => false);

  bool get isInitialized =>
      maybeWhen(initialized: (_) => true, orElse: () => false);

  bool get isCancelled => maybeWhen(cancelled: () => true, orElse: () => false);

  /// get state data
  Exception get failure =>
      maybeWhen(failure: (error) => error, orElse: StateOfException.new);

  T? get data => maybeWhen(
        success: (data) => data,
        initialized: (data) => data,
        orElse: () => null,
      );
}
