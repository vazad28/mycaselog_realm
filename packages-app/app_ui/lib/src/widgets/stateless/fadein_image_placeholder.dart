// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

/// An image that shows a [placeholder] widget while the target [image] is
/// loading, then fades in the new image when it loads.
///
/// This is similar to [FadeInImage] but the difference is that it allows you
/// to specify a widget as a [placeholder], instead of just an [ImageProvider].
/// It also lets you override the [child] argument, in case you want to wrap
/// the image with another widget, for example an [Ink.image].
class FadeInImageWithPlaceholder extends StatelessWidget {
  const FadeInImageWithPlaceholder({
    required this.image,
    required this.placeholder,
    super.key,
    this.child,
    this.duration = const Duration(milliseconds: 100),
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.fit,
  });

  /// What widget you want to display instead of [placeholder] after [image] is
  /// loaded.
  ///
  /// Defaults to display the [image].
  final Widget? child;

  /// The duration for how long the fade out of the placeholder and
  /// fade in of [child] should take.
  final Duration duration;

  /// See [Image.excludeFromSemantics].
  final bool excludeFromSemantics;

  /// See [Image.fit].
  final BoxFit? fit;

  /// See [Image.height].
  final double? height;

  /// The target image that we are loading into memory.
  final ImageProvider image;

  /// Widget displayed while the target [image] is loading.
  final Widget placeholder;

  /// See [Image.width].
  final double? width;

  @override
  Widget build(BuildContext context) {
    final imageWidget = Image(
      image: image,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      fit: fit, //null is important to maintain view in zoom view of media
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return this.child ?? child;
        } else {
          return AnimatedSwitcher(
            duration: duration,
            child: frame != null ? this.child ?? child : placeholder,
          );
        }
      },
      errorBuilder: (_, exception, __) {
        return ColoredBox(
          color: Theme.of(context).colorScheme.errorContainer,
          child: AspectRatio(
            aspectRatio: 1,
            child: Icon(
              Icons.broken_image,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        );
      },
    );

    return imageWidget;
  }
}
