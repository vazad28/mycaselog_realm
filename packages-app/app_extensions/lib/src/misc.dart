extension MiscExt on String {
  // ignore: unused_element
  bool parseBool() {
    return toLowerCase() == 'true';
  }

  String changeFileName(String replacement) {
    // Use split and firstWhere to get the part before the dot
    final parts = split('.');

    // Combine the replacement and remaining parts after joining
    return '$replacement.${parts.skip(1).join('.')}';
  }
}
