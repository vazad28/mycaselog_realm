extension ListUpdate<T> on List<T> {
  List<T> replaceOrAdd(T obj) {
    final index = indexOf(obj);
    if (index >= 0) {
      removeAt(index);
      insert(index, obj);
    } else {
      add(obj);
    }
    return this;
  }
}
