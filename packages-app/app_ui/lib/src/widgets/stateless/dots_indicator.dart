import 'dart:math';

import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  const DotsIndicator({
    required this.controller, required this.itemCount, required this.color, super.key,
    this.onPageSelected,
  }) : super(listenable: controller);

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;

  // The base size of the dots
  static const double _kDotSize = 3;

  // The distance between the center of each dot
  static const double _kDotSpacing = 15;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2;

  Widget _buildDot(int index) {
    double selectedness;
    if (controller.hasClients) {
      selectedness = Curves.easeOut.transform(
        max(
          0,
          1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
        ),
      );
    } else {
      selectedness = index == 0 ? 1.0 : 0.0;
    }
    final zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return SizedBox(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: SizedBox(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            // child: InkWell(
            //   onTap: () => onPageSelected(index),
            // ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
