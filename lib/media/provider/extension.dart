import 'package:flutter/material.dart';
import 'package:state_of/state_of.dart';

extension MediaGridExt on BuildContext {
  Pair<int, double> gridPair(int mediaTileStyle) {
    final maxWidth = MediaQuery.of(this).size.width;

    final crossAxisCount = mediaTileStyle == 0
        ? (maxWidth ~/ 96).clamp(2, 8)
        : (maxWidth ~/ 175).clamp(2, 8);

    final gridItemWidth = (maxWidth / crossAxisCount).ceil().toDouble();
    return Pair(crossAxisCount, gridItemWidth);
  }
}
