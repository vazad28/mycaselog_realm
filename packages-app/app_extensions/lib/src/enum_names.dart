extension EnumValuesNames<T extends Enum> on Iterable<T> {
  List<String> get names {
    final input = this;
    return input.map((e) => e.name).toList();
  }

  T find(T item) {
    final input = this;
    return input.firstWhere(
      (element) => element == item,
      orElse: () => input.first,
    );
  }

  T containsItem(T item) {
    final input = this;
    return input.firstWhere(
      (element) => element == item,
      orElse: () => input.first,
    );
  }
}
