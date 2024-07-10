import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'stats_mixins.dart';

part '../../generated/stats/provider/stats_provider.freezed.dart';
part '../../generated/stats/provider/stats_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
class ToDo {}

@riverpod
class StatsNotifier extends _$StatsNotifier with LoggerMixin {
  @override
  StateOf<ToDo> build() {
    return const StateOf<ToDo>.init();
  }

  /// Map events to state
  void on(StatsEvent event) {
    event.map(addStats: (value) => {});
  }
}
