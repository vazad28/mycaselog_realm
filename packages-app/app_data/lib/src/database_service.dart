import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'collections/storage_collection.dart';
import 'domain/database_collection.dart';

part 'collections/cases_collection.dart';
part 'collections/media_collection.dart';
part 'collections/settings_collection.dart';
part 'collections/support_data_collection.dart';
part 'collections/templates_collection.dart';
part 'collections/timeline_notes_collection.dart';
part 'collections/users_collection.dart';
// part 'collections/vault_collection.dart';
part 'collections/notes_collection.dart';

class DatabaseService {
  DatabaseService({
    required String userID,
    required Realm realm,
    required SharedPreferences sharedPrefs,
  })  : _userID = userID,
        _storageCollection = StorageCollection(userID),
        _casesCollection = CasesCollection(userID, realm, sharedPrefs),
        _mediaCollection = MediaCollection(userID, realm, sharedPrefs),
        _notesCollection = NotesCollection(userID, realm, sharedPrefs),
        _usersCollection = UsersCollection(userID, realm, sharedPrefs),
        _settingsCollection = SettingsCollection(userID, realm, sharedPrefs),
        _supportDataCollection =
            SupportDataCollection(userID, realm, sharedPrefs),
        _timelineNotesCollection =
            TimelineNotesCollection(userID, realm, sharedPrefs),
        _templatesCollection = TemplatesCollection(userID, realm, sharedPrefs);

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get firestoreStorage => FirebaseStorage.instance;

  late final String _userID;
  String get userID => _userID;

  /// Storage
  late final StorageCollection _storageCollection;
  late final CasesCollection _casesCollection;
  late final MediaCollection _mediaCollection;
  late final NotesCollection _notesCollection;
  late final UsersCollection _usersCollection;
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
  UsersCollection get usersCollection => _usersCollection;

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
