import 'package:intl/intl.dart';

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

  String get sentenceCase => toBeginningOfSentenceCase(this);

  String get camelToTitleCase {
    final result = replaceAll(RegExp('(?<!^)(?=[A-Z])'), ' ');
    final finalResult = result[0].toUpperCase() + result.substring(1);
    return finalResult;
  }

  String get titleCase {
    if (isEmpty) return this;

    // Basic implementation: capitalize first letter of each word
    return split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
              : word,
        )
        .join(' ');
  }
}

extension EnumX on Enum {
  String get enumToTitleCase {
    return name.camelToTitleCase;
  }
}
