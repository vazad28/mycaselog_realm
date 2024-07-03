extension ListExtensions on List {
  List<T> replaceOrAdd<T>(T obj) {
    final index = indexOf(obj);
    if (index >= 0) {
      removeAt(index);
      insert(index, obj);
    } else {
      add(obj);
    }
    return this as List<T>;
  }
}
