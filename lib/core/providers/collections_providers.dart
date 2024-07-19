import 'dart:async';

import 'package:app_repositories/app_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part '../../generated/core/providers/collections_providers.g.dart';

@riverpod
Future<RealmDatabase> realmDatabase(RealmDatabaseRef ref) async {
  final userFuture = ref.watch(authenticationUserStreamProvider.future);

  final user = await userFuture;

  final realmDb = await RealmDatabase.init(user);
  ref.onDispose(realmDb.dispose);

  return realmDb;
}

@riverpod
Collections collections(CollectionsRef ref) {
  final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;
  return Collections(realmDatabase: realmDatabase);
}

// @riverpod
// CasesCollection casesCollection(CasesCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return CasesCollection(realmDatabase);
// }

// @riverpod
// MediaCollection mediaCollection(MediaCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return MediaCollection(realmDatabase);
// }

// @riverpod
// TemplatesCollection templatesCollection(TemplatesCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return TemplatesCollection(realmDatabase);
// }

// @riverpod
// StorageCollection storageCollection(StorageCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return StoreageCollection(realmDatabase);
// }

// @riverpod
// UserCollection userCollection(UserCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return UserCollection(realmDatabase);
// }

// @riverpod
// NotesCollection notesCollection(NotesCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return NotesCollection(realmDatabase);
// }

// @riverpod
// TimelineNotesCollection timelineNotesCollection(
//     TimelineNotesCollectionRef ref) {
//   final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;

//   return TimelineNotesCollection(realmDatabase);
// }
