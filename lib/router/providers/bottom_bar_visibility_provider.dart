import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/router/providers/bottom_bar_visibility_provider.g.dart';

/// A state provider holding the state for the visibility of the
/// bottom navigation bar
@Riverpod(keepAlive: true)
class BottomNavVisibility extends _$BottomNavVisibility {
  @override
  bool build() => true;

  // ignore: avoid_positional_boolean_parameters
  bool update({required bool value}) => state = value;

  /// toggle the state of the visibility provider
  void toggle() => state = !state;
}
