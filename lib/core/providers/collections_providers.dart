import 'dart:async';

import 'package:app_repositories/app_repositories.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_providers.dart';

part '../../generated/core/providers/collections_providers.g.dart';

@Riverpod(keepAlive: true)
Future<RealmDatabase> realmDatabase(RealmDatabaseRef ref) async {
  final userFuture = ref.watch(authenticationUserStreamProvider.future);

  final user = await userFuture;

  final realmDb = await RealmDatabase.init(user);
  ref.onDispose(realmDb.dispose);

  return realmDb;
}

@Riverpod(keepAlive: true)
Realm realm(RealmRef ref) {
  return ref.watch(realmDatabaseProvider).value!.realm;
}

@Riverpod(keepAlive: true)
Collections collections(CollectionsRef ref) {
  final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;
  if (kDebugMode) print('creatign collection provider');
  return Collections(realmDatabase: realmDatabase);
}
