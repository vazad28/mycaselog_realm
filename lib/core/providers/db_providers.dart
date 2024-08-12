part of 'providers.dart';

@Riverpod(keepAlive: true)
Future<RealmDatabase> realmDatabase(RealmDatabaseRef ref) async {
  final userFuture = ref.watch(authenticationUserStreamProvider.future);

  final user = await userFuture;

  if (user.isAnonymous) ref.invalidateSelf();

  final realmDb = await RealmDatabase.init(user);

  ref.onDispose(realmDb.dispose);

  return realmDb;
}

@Riverpod(keepAlive: true)
Collections db(DbRef ref) {
  final realmDatabase = ref.watch(realmDatabaseProvider).requireValue;
  if (kDebugMode) print('creating collections provider');
  return Collections(realmDatabase: realmDatabase);
}

@Riverpod(keepAlive: true)
class Crud extends _$Crud {
  late Realm _realm;

  @override
  void build() {
    _realm = ref.watch(realmDatabaseProvider).value!.realm;
  }

  Future<void> crud<T extends RealmObject>(
    T object,
    CrudAction crudAction,
  ) async {
    return _realm.writeAsync(() {
      if (crudAction == CrudAction.delete) {
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
      if (crudAction == CrudAction.delete) {
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
