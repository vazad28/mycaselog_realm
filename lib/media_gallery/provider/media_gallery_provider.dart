import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/providers/db_provider.dart';

part '../../generated/media_gallery/provider/media_gallery_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class MediaGalleryNotifier extends _$MediaGalleryNotifier with LoggerMixin {
  @override
  StateOf<MediaModel> build() {
    return const StateOf<MediaModel>.init();
  }
}
