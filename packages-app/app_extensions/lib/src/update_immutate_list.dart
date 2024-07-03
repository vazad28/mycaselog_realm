extension ModifyImmutableList<T> on Iterable<T> {
  List<T> updatedImmutableList(int index, T newValue) {
    final modifiableList = List<T>.from(this);
    if (index == -1) {
      /// inset the item
    }
    modifiableList[index] = newValue;
    return modifiableList;
  }
}
