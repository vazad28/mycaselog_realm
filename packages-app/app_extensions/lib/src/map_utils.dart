/// Functional programming functions on a mutable dart [Map] using `fpdart`.
extension UtilsOnMutableMap<K, V> on Map<K, V> {
  /// Convert each **value** of the [Map] using the `update` function and
  /// returns a new [Map].
  Map<K, A> mapValue<A>(A Function(V value) update) =>
      map((key, value) => MapEntry(key, update(value)));

  /// Convert each **value** of the [Map] using the `update` function and
  /// returns a new [Map].
  Map<K, A> mapWithIndex<A>(A Function(V value, int index) update) {
    final entries = this.entries;
    final mapped = <K, A>{};
    var i = 0;
    for (final item in entries) {
      mapped.addEntries([MapEntry(item.key, update(item.value, i))]);
      i += 1;
    }
    return mapped;
  }

  /// Returns the list of those elements of the [Map] whose **value**
  /// satisfies `predicate`.
  Map<K, V> filter(bool Function(V value) predicate) {
    final entries = this.entries;
    final filteredMap = <K, V>{};
    for (final item in entries) {
      if (predicate(item.value)) {
        filteredMap.addEntries([item]);
      }
    }
    return filteredMap;
  }

  /// Returns the list of those elements of the [Map] whose **value**
  /// satisfies `predicate`.
  Map<K, V> filterWithIndex(bool Function(V value, int index) predicate) {
    final entries = this.entries;
    final filteredMap = <K, V>{};
    var i = 0;
    for (final item in entries) {
      if (predicate(item.value, i)) {
        filteredMap.addEntries([item]);
      }
      i += 1;
    }
    return filteredMap;
  }

  /// Returns the list of those elements of the [Map] whose key/value
  /// satisfies `predicate`.
  Map<K, V> filterWithKey(bool Function(K key, V value) predicate) {
    final entries = this.entries;
    final filteredMap = <K, V>{};
    for (final item in entries) {
      if (predicate(item.key, item.value)) {
        filteredMap.addEntries([item]);
      }
    }
    return filteredMap;
  }

  /// Returns the list of those elements of the [Map] whose key/value
  /// satisfies `predicate`.
  Map<K, V> filterWithKeyAndIndex(
    bool Function(K key, V value, int index) predicate,
  ) {
    final entries = this.entries;
    final filteredMap = <K, V>{};
    var i = 0;
    for (final item in entries) {
      if (predicate(item.key, item.value, i)) {
        filteredMap.addEntries([item]);
      }
      i += 1;
    }
    return filteredMap;
  }

  /// Sort Map by Key
  bool mapChanged(
    Map<String, dynamic> formValue,
  ) {
    for (final entry in formValue.entries) {
      //print('${[entry.key]} ${formValue[entry.key]} = ${this[entry.key]}');
      if (formValue[entry.key] != this[entry.key]) return false;
    }

    return true;
  }
}
