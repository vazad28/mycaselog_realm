import 'package:flutter/material.dart';

import 'app_spacing.dart';

/// Horizontal spacer widgets
abstract class HorizontalSpacer {
  static const small = _SmallSpacer(axis: Axis.horizontal);

  static const normal = _Spacer(axis: Axis.horizontal);

  static const large = _LargeSpacer(axis: Axis.horizontal);

  static const smallSliver = SliverToBoxAdapter(
    child: _SmallSpacer(axis: Axis.horizontal),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(axis: Axis.horizontal),
  );

  static const lgSliver = SliverToBoxAdapter(
    child: _LargeSpacer(axis: Axis.horizontal),
  );
}

/// Vertical spacer widgets.
abstract class VerticalSpacer {
  static const small = _SmallSpacer(axis: Axis.vertical);

  static const normal = _Spacer(axis: Axis.vertical);

  static const large = _LargeSpacer(axis: Axis.vertical);

  static const smallSliver = SliverToBoxAdapter(
    child: _SmallSpacer(axis: Axis.vertical),
  );

  static const normalSliver = SliverToBoxAdapter(
    child: _Spacer(axis: Axis.vertical),
  );

  static const lgSliver = SliverToBoxAdapter(
    child: _LargeSpacer(axis: Axis.vertical),
  );
}

class _Spacer extends StatelessWidget {
  const _Spacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis == Axis.horizontal ? AppSpacing.md : null,
      height: axis == Axis.vertical ? AppSpacing.md : null,
    );
  }
}

class _SmallSpacer extends StatelessWidget {
  const _SmallSpacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis == Axis.horizontal ? AppSpacing.sm : null,
      height: axis == Axis.vertical ? AppSpacing.sm : null,
    );
  }
}

class _LargeSpacer extends StatelessWidget {
  const _LargeSpacer({
    required this.axis,
  });

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: axis == Axis.horizontal ? AppSpacing.lg : null,
      height: axis == Axis.vertical ? AppSpacing.lg : null,
    );
  }
}
