// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'ansi_color.dart';

/// A convenience mixin to expose a [Logger] instance for classes named after
/// their type.
mixin LoggerMixin {
  Logger get logger => Logger('$runtimeType');
}

/// Adds a listener to the top-level root logger.
void initializeLogger({String? prefix}) {
  if (kReleaseMode) return;

  Logger.root.level = Level.ALL;

  const separator = ' | ';
  const horizontalSeparator = '--------------------------------';

  Logger.root.onRecord.listen((rec) {
    final content = [
      //rec.time,
      //DateFormat('HH:mm:s.S').format(DateTime.now()),
      //separator,
      if (prefix != null) ...[
        prefix,
        separator,
      ],
      rec.level.name.padRight(1),
      separator,
      if (rec.loggerName.isNotEmpty) ...[
        rec.loggerName.padRight(2),
        separator,
      ],
      rec.message,
    ];

    //final color = _colorForLevel(rec.level);

    //print(color(content.join()));
    print(content.join());

    if (rec.error != null) {
      final color = _colorForLevel(rec.level);
      print(color(horizontalSeparator));
      print(color('ERROR'));
      print(color(rec.error.toString()));
      print(color(horizontalSeparator));

      if (rec.stackTrace != null) {
        print(color('STACK TRACE'));
        for (final line in rec.stackTrace.toString().trim().split('\n')) {
          print(color(line));
        }
        print(color(horizontalSeparator));
      }
    }
  });
}

final _levelColors = {
  Level.FINEST: AnsiColor.fg(AnsiColor.grey(0.5)),
  Level.FINER: AnsiColor.fg(AnsiColor.grey(0.5)),
  Level.FINE: AnsiColor.fg(AnsiColor.grey(0.5)),
  Level.CONFIG: AnsiColor.fg(12),
  Level.INFO: AnsiColor.fg(12),
  Level.WARNING: AnsiColor.fg(208),
  Level.SEVERE: AnsiColor.fg(196),
  Level.SHOUT: AnsiColor.fg(199),
};

AnsiColor _colorForLevel(Level level) {
  return _levelColors[level] ?? AnsiColor.none();
}
