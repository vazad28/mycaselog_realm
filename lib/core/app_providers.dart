import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_repositories/app_repositories.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

import '../settings/settings.dart';
import '../sync/sync.dart';
import 'core.dart';

part '../generated/core/app_providers.g.dart';
part 'providers/auth_providers.dart';
part 'providers/connectivity_provider.dart';
part 'providers/db_providers.dart';
part 'providers/startup_providers.dart';
part 'providers/storage_providers.dart';

/// EXTENSIONS
extension AutoDisposeStreamSubscription on StreamSubscription {
  void cancelOnDispose(Ref ref) {
    ref.onDispose(cancel);
  }
}
