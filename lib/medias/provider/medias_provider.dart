import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

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
}
