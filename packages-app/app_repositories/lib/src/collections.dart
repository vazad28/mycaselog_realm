import 'dart:io';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';

import '../app_repositories.dart';

part 'collections/cases_collection.dart';
part 'collections/media_collection.dart';
part 'collections/notes_collection.dart';
part 'collections/settings_collection.dart';
part 'collections/storage_collection.dart';
part 'collections/support_data_collection.dart';
part 'collections/templates_collection.dart';
part 'collections/timeline_notes_collection.dart';
part 'collections/user_collection.dart';

class Collections {
  Collections({
    required RealmDatabase realmDatabase,
  })  : _storageCollection = StorageCollection(realmDatabase),
        _casesCollection = CasesCollection(realmDatabase),
        _mediaCollection = MediaCollection(realmDatabase),
        _notesCollection = NotesCollection(realmDatabase),
        _userCollection = UserCollection(realmDatabase),
        _settingsCollection = SettingsCollection(realmDatabase),
        _supportDataCollection = SupportDataCollection(realmDatabase),
        _timelineNotesCollection = TimelineNotesCollection(realmDatabase),
        _templatesCollection = TemplatesCollection(realmDatabase);

  /// Collections vars
  late final StorageCollection _storageCollection;
  late final CasesCollection _casesCollection;
  late final MediaCollection _mediaCollection;
  late final NotesCollection _notesCollection;
  late final UserCollection _userCollection;
  late final SupportDataCollection _supportDataCollection;
  late final SettingsCollection _settingsCollection;
  late final TimelineNotesCollection _timelineNotesCollection;
  late final TemplatesCollection _templatesCollection;

  /// Firebase storage
  StorageCollection get storageCollection => _storageCollection;

  /// Cases Collection  getter
  CasesCollection get casesCollection => _casesCollection;

  /// Media Collection  getter
  MediaCollection get mediaCollection => _mediaCollection;

  /// Notes Collection getter
  NotesCollection get notesCollection => _notesCollection;

  /// Cases Collection  getter
  UserCollection get usersCollection => _userCollection;

  /// Settings Collecton getter
  SettingsCollection get settingsCollection => _settingsCollection;

  /// Support Data Collection
  SupportDataCollection get supportDataCollection => _supportDataCollection;

  /// Timeline NOtes Collection  getter
  TimelineNotesCollection get timelineNotesCollection =>
      _timelineNotesCollection;

  /// Templates Collection  getter
  TemplatesCollection get templatesCollection => _templatesCollection;
}
