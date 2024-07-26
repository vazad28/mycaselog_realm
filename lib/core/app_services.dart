import 'dart:async';
import 'dart:convert';

import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:async_result/async_result.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:storage/storage.dart';

import '../settings/settings.dart';
import './core.dart';

part '../generated/core/app_services.g.dart';
part './services/dialog_service.dart';
part './services/encryption_service.dart';
part './services/fts_search_service.dart';
part './services/local_storage.dart';
part 'services/image_upload_service.dart';
