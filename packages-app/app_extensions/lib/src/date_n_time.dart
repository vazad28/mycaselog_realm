import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYMD() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String formatHMS() {
    return DateFormat.yMMMMd().add_jm().format(this);
  }

  String formatMDY() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String formatHMJ() {
    return DateFormat.jm().format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}

extension DateFromIntExt on int {
  String format(String format) {
    return DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String formatYMD() {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String formatHMS() {
    return DateFormat.yMMMMd()
        .add_jm()
        .format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String formatHM() {
    return DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  String formatMDY() {
    return DateFormat('MMM dd, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(this));
  }

  bool isToday() {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    final now = DateTime.now();
    return now.day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year;
  }
}

extension TimestampFromStringExt on String {
  int timestampFromYMD() {
    final dateTime = DateFormat('yyyy-MM-dd').parse(this);
    return dateTime.millisecondsSinceEpoch;
  }
}
