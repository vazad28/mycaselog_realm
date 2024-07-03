import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_of_form.codegen.freezed.dart';

class StateOfFormException implements Exception {}

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions(when: true, whenOrNull: false),
  map: FreezedMapOptions(map: true, maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class StateOfForm<T> with _$StateOfForm<T> {
  const StateOfForm._();

  const factory StateOfForm.failure(Exception e) = _failure<T>;
  const factory StateOfForm.init() = _init<T>;
  const factory StateOfForm.initialized() = _initialized<T>;
  const factory StateOfForm.validationError() = _validationError<T>;
  const factory StateOfForm.submitting([String? message]) = _submitting<T>;
  const factory StateOfForm.success(T data) = _success<T>;

  bool get isFailure => maybeWhen(failure: (_) => true, orElse: () => false);
  bool get isInit => maybeWhen(init: () => true, orElse: () => false);
  bool get isInitialized =>
      maybeWhen(initialized: () => true, orElse: () => false);
  bool get isSubmitting =>
      maybeWhen(submitting: (_) => true, orElse: () => false);
  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);
  bool get isValidationError =>
      maybeWhen(validationError: () => true, orElse: () => false);

  Exception get failure => maybeWhen(
        failure: (error) => error,
        orElse: StateOfFormException.new,
      );

  T? get success => maybeWhen(
        success: (data) => data,
        orElse: () => throw StateOfFormException(),
      );
}
