extension StringExtensions on String {
  bool containsIgnoreCaseSIS(String secondString) {
    // ignore: unnecessary_this
    final input = this;
    return input.toLowerCase().contains(secondString.toLowerCase());
  }

  bool searchIgnoreCaseSIS(String secondString) {
    final input = this;
    final secondStringLower = secondString.toLowerCase();
    final sanitizedQuery =
        input.toLowerCase().replaceAll(RegExp(r'[^\s\w]'), '');
    final sanitizedQueryList = sanitizedQuery.split(' ');
    return sanitizedQueryList
        .any((item) => secondStringLower.contains(item.trim()));
  }
}

extension ListCompare on List<String>? {
  bool containsIgnoreCaseSIL(String? queryString) {
    final input = this;

    if (input == null || queryString == null || queryString.isEmpty) {
      return false;
    }
    final lowerCaseList =
        input.map((e) => e.toLowerCase().trim()).toSet().toList();
    final contains = lowerCaseList.contains(queryString.trim().toLowerCase());

    return contains;
  }

  bool containsIgnoreCaseLIL(List<String> queryStringList) {
    final input = this;
    if (input == null) return false;
    final lowerCaseList = input.map((e) => e.toLowerCase().trim()).toList();
    final lowerCaseQueryStringList =
        queryStringList.map((e) => e.toLowerCase().trim()).toSet().toList();

    return lowerCaseList.toSet().containsAll(lowerCaseQueryStringList);
  }
}
