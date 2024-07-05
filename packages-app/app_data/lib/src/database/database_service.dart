import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/firestore_collection.dart';

// import '../../exception/api_client_exception.codegen.dart';
// import 'firestore_collection.dart';
// import 'storage_collection.dart';

part 'collections/cases_collection.dart';
// part 'collections/media_collection.dart';
// part 'collections/settings_collection.dart';
part 'collections/support_data_collection.dart';
// part 'collections/sync_collection.dart';
// part 'collections/templates_collection.dart';
// part 'collections/timeline_notes_collection.dart';
// part 'collections/users_collection.dart';
// part 'collections/vault_collection.dart';
// part 'collections/notes_collection.dart';

class DatabaseService {
  DatabaseService(
    String userID,
    Realm realm,
    SharedPreferences sharedPrefs,
  )   :
        // _storageCollection = StorageCollection(userID),
        //   _vaultCollection = VaultCollection(userID),
        _casesCollection = CasesCollection(userID, realm, sharedPrefs),
        // _mediaCollection = MediaCollection(userID),
        // _notesCollection = NotesCollection(userID),
        // _usersCollection = UsersCollection(userID),
        // _settingsCollection = SettingsCollection(userID),
        _supportDataCollection =
            SupportDataCollection(userID, realm, sharedPrefs);
  // _timelineNotesCollection = TimelineNotesCollection(userID),
  // _templatesCollection = TemplatesCollection(userID);

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirebaseStorage get firestoreStorage => FirebaseStorage.instance;

  /// Storage
  // late final StorageCollection _storageCollection;
  // late final VaultCollection _vaultCollection;
  late final CasesCollection _casesCollection;
  // late final MediaCollection _mediaCollection;
  // late final NotesCollection _notesCollection;
  // late final UsersCollection _usersCollection;
  late final SupportDataCollection _supportDataCollection;
  // late final SettingsCollection _settingsCollection;
  // late final TimelineNotesCollection _timelineNotesCollection;
  // late final TemplatesCollection _templatesCollection;

  /// Firebase storage
  //StorageCollection get storageCollection => _storageCollection;

  /// Vault collection getter
  //VaultCollection get vaultCollection => _vaultCollection;

  /// Cases Collection  getter
  CasesCollection get casesCollection => _casesCollection;

  /// Media Collection  getter
  //MediaCollection get mediaCollection => _mediaCollection;

  /// Notes Collection getter
  //NotesCollection get notesCollection => _notesCollection;

  /// Cases Collection  getter
  // UsersCollection get usersCollection => _usersCollection;

  /// Settings Collecton getter
  //SettingsCollection get settingsCollection => _settingsCollection;

  /// Support Data Collection
  SupportDataCollection get supportDataCollection => _supportDataCollection;

  /// Timeline NOtes Collection  getter
  // TimelineNotesCollection get timelineNotesCollection =>
  //     _timelineNotesCollection;

  /// Templates Collection  getter
  //TemplatesCollection get templatesCollection => _templatesCollection;
}
