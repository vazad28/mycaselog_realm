import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

export './auth_providers.dart';
export './media_upload_repository_provider.dart';
export './startup_providers.dart';
export './storage_providers.dart';
export './collections_providers.dart';
export './ui_providers.dart';

/// EXTENSIONS
extension AutoDisposeStreamSubscription on StreamSubscription {
  void cancelOnDispose(Ref ref) {
    ref.onDispose(cancel);
  }
}
