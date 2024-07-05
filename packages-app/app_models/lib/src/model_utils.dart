import 'package:intl/intl.dart';
import 'package:ulid/ulid.dart';

class ModelUtils {
  ///get current timestamp
  static int get getTimestamp => DateTime.now().millisecondsSinceEpoch;

  static DateTime get dateTime => DateTime.now();

  static String formatMDY(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  /// create unique ID for documents
  static String get uniqueID => Ulid().toCanonical();

  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int stringToIntId(String string) {
    // ignore: avoid_js_rounded_ints
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }

  static String formatYMD(int timestamp) {
    return DateFormat('MMM dd, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}
