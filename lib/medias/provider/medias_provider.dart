import 'package:app_models/app_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'medias_mixins.dart';

part '../../generated/medias/provider/medias_provider.freezed.dart';
part '../../generated/medias/provider/medias_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
class MediaModel {}

@riverpod
class MediasNotifier extends _$MediasNotifier with LoggerMixin {
  @override
  StateOf<MediaModel> build() {
    return const StateOf<MediaModel>.init();
  }

  /// Map events to state
  void on(MediasEvent event) {
    event.map(addMedias: (value) => {});
  }
}
