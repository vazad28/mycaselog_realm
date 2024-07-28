import 'dart:async';
import 'dart:convert';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_repositories/app_repositories.dart';
import 'package:app_ui/app_ui.dart';
import 'package:async_result/async_result.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

import '../../settings/settings.dart';
import '../../sync/sync.dart';
import '../core.dart';

part 'auth_providers.dart';
part 'connectivity_provider.dart';
part 'db_providers.dart';
part 'startup_providers.dart';
part 'encryption_client_provider.dart';
part 'local_storage_provider.dart';
part 'dialog_service_provider.dart';
part 'image_upload_provider.dart';

part '../../generated/core/providers/providers.g.dart';

/// EXTENSIONS
extension AutoDisposeStreamSubscription on StreamSubscription {
  void cancelOnDispose(Ref ref) {
    ref.onDispose(cancel);
  }
}