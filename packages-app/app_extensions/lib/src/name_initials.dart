extension NameInitials on String? {
  String get initials {
    final name = this;
    if (name == null) return '';
    final split = name.trim().split(RegExp(r'\s+'));
    final allInitials = split.map((s) => s[0]).toList().join();

    if (allInitials.length <= 3) return allInitials.toUpperCase();

    final initialsDual =
        allInitials[0] + allInitials[1] + allInitials[allInitials.length - 1];
    return initialsDual.toUpperCase();
  }
}
