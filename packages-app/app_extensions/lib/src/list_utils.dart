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

  /// Adds or updates an object in the list based on its ID.
  ///
  /// - [object]: The object to add or update.
  /// - [idGetter]: A function that retrieves the ID from an object in the list.
  /// - [updateFn]: An optional function to modify the existing object before update (in-place).
  void replaceOrAddComplex(
    T object,
    String Function(T) idGetter,
  ) {
    final index = indexWhere((item) => idGetter(item) == idGetter(object));
    if (index == -1) {
      // Object not found, add it
      add(object);
    } else {
      // Object found, update it
      removeAt(index);
      add(object);
      // if (updateFn != null) {
      //   updateFn(existingObject);
      // } else {
      //   // Default update behavior (replace with the new object)
      //   this[index] = object;
      // }
    }
  }
}
