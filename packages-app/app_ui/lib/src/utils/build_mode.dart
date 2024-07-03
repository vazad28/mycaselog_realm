import 'package:flutter/foundation.dart';

enum BuildMode { release, profile, debug }

// ignore: unnecessary_parenthesis
BuildMode buildMode = (() {
  if (kReleaseMode) {
    return BuildMode.release;
  }
  var result = BuildMode.profile;
  assert(
    () {
      result = BuildMode.debug;
      return true;
    }(),
    'no message',
  );
  return result;
}());
