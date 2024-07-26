part of '../app_providers.dart';

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
Collections db(DbRef ref) {
  final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;
  if (kDebugMode) print('creatign collection provider');
  return Collections(realmDatabase: realmDatabase);
}

@Riverpod(keepAlive: true)
class Crud extends _$Crud {
  late Realm _realm;

  @override
  void build() {
    _realm = ref.watch(realmProvider);
  }

  Future<void> crud<T extends RealmObject>(
    T object,
    CrudAction crudAction,
  ) async {
    return _realm.writeAsync(() {
      if (crudAction == CrudAction.remove) {
        _realm.delete<T>(object);
      } else {
        _realm.add<T>(object, update: true);
      }
    });
  }

  RealmList<T> upsertRealmList<T>(
    RealmList<T> realmList,
    T element,
    CrudAction crudAction,
  ) {
    return _realm.write(() {
      if (crudAction == CrudAction.remove) {
        realmList.remove(element);
      } else {
        final index = realmList.indexOf(element);
        if (index == -1) {
          realmList.add(element);
        } else {
          realmList
            ..removeAt(index)
            ..insert(index, element);
        }
      }
      return realmList;
    });
  }
}
