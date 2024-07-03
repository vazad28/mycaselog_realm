extension SortIterable<E> on Iterable<E> {
  // ignore: use_function_type_syntax_for_parameters
  Iterable<E> sortBy(Comparable key(E e)) =>
      toList()..sort((a, b) => key(a).compareTo(key(b)));

  Iterable<E> sortByDescending(Comparable Function(E e) key) =>
      toList()..sort((a, b) => key(b).compareTo(key(a)));
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
        <K, List<E>>{},
        (Map<K, List<E>> map, E element) =>
            map..putIfAbsent(keyFunction(element), () => <E>[]).add(element),
      );
}
