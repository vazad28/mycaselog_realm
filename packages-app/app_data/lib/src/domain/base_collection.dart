class BaseCollection {
  factory BaseCollection() => _instance;

  BaseCollection._();
  static final BaseCollection _instance = BaseCollection._();

  /// Flag to indicate ignoring changes from the firestore database.
  bool ignoreFirestoreChanges = true;

  /// Flag to indicate ignoring changes from the Realm database.
  bool ignoreRealmChanges = false;
}
