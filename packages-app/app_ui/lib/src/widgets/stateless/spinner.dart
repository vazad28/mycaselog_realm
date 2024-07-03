import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key, this.color, this.dimension});

  final Color? color;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final spinner = kIsWeb
        ? const LinearProgressIndicator()
        : Platform.isAndroid
            ? CircularProgressIndicator(
                strokeWidth: 1.5,
                valueColor:
                    AlwaysStoppedAnimation<Color>(theme.colorScheme.onSurface),
              )
            : CupertinoActivityIndicator(
                color: color ?? theme.colorScheme.onSurface,
              );

    final w = SizedBox.square(
      dimension: dimension ?? 24,
      child: Align(
        child: spinner,
      ),
    );

    return w;
  }
}
