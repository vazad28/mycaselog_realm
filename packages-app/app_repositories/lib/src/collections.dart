import 'dart:async';
import 'dart:io';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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
  })  : storageCollection = StorageCollection(realmDatabase),
        casesCollection = CasesCollection(realmDatabase),
        mediaCollection = MediaCollection(realmDatabase),
        notesCollection = NotesCollection(realmDatabase),
        userCollection = UserCollection(realmDatabase),
        settingsCollection = SettingsCollection(realmDatabase),
        supportDataCollection = SupportDataCollection(realmDatabase),
        timelineNotesCollection = TimelineNotesCollection(realmDatabase),
        templatesCollection = TemplatesCollection(realmDatabase);

  /// Collections vars
  final StorageCollection storageCollection;
  final CasesCollection casesCollection;
  final MediaCollection mediaCollection;
  final NotesCollection notesCollection;
  final UserCollection userCollection;
  final SupportDataCollection supportDataCollection;
  final SettingsCollection settingsCollection;
  final TimelineNotesCollection timelineNotesCollection;
  final TemplatesCollection templatesCollection;
}
