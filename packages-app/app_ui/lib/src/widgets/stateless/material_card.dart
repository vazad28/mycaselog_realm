import 'package:flutter/material.dart';

const _kThinBorderWidth = 0.5;
const _kCardRadius = 12.0;
const _kCardPadding = EdgeInsets.symmetric(vertical: 8, horizontal: 16);

enum BorderSides { tile, all }

class MaterialCard extends StatelessWidget {
  const MaterialCard.elevated({
    required this.child,
    super.key,
    this.backgroundColor,
    this.elevation = 1.0,
    this.onTap,
    this.onLongPress,
    this.clipBehavior = Clip.antiAlias,
    this.padding = _kCardPadding,
    this.outsidePadding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.borderRadius = _kCardRadius,
    this.borderColor,
    this.borderWidth = _kThinBorderWidth,
  })  : materialType = MaterialType.card,
        borderSides = BorderSides.all,
        showOutline = false;

  const MaterialCard.outlined({
    required this.child,
    super.key,
    this.backgroundColor,
    this.elevation = 0.0,
    this.onTap,
    this.onLongPress,
    this.clipBehavior = Clip.antiAlias,
    this.padding = _kCardPadding,
    this.margin = EdgeInsets.zero,
    this.outsidePadding = EdgeInsets.zero,
    this.borderRadius = _kCardRadius,
    this.borderColor,
    this.borderWidth = _kThinBorderWidth,
  })  : materialType = backgroundColor == null
            ? MaterialType.transparency
            : MaterialType.canvas,
        borderSides = BorderSides.all,
        showOutline = true;

  const MaterialCard.bordered({
    required this.child,
    super.key,
    this.backgroundColor,
    this.elevation = 0.0,
    this.onTap,
    this.onLongPress,
    this.clipBehavior = Clip.antiAlias,
    this.padding = _kCardPadding,
    this.margin = EdgeInsets.zero,
    this.outsidePadding = EdgeInsets.zero,
    this.borderRadius = 0,
    this.borderColor,
    this.borderWidth = _kThinBorderWidth,
  })  : materialType = backgroundColor == null
            ? MaterialType.transparency
            : MaterialType.canvas,
        borderSides = BorderSides.tile,
        showOutline = true;

  final Color? backgroundColor;
  final double elevation;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget child;
  final Clip clipBehavior;
  final EdgeInsets padding;
  final EdgeInsets outsidePadding;
  final EdgeInsets margin;

  final MaterialType materialType;
  final bool showOutline;
  final BorderSides borderSides;

  @override
  Widget build(BuildContext context) {
    final widget = Material(
      clipBehavior: clipBehavior,
      type: materialType,
      color: backgroundColor,
      elevation: elevation,
      shape: borderSides == BorderSides.all
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: !showOutline
                  ? BorderSide.none
                  : BorderSide(
                      width: borderWidth,
                      color:
                          borderColor ?? Theme.of(context).colorScheme.outline,
                    ),
            )
          : null,
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(padding: padding, child: child),
            )
          : Padding(padding: padding, child: child),
    );

    return Container(
      margin: margin,
      decoration: borderSides != BorderSides.all
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: borderWidth,
                  color: borderColor ?? Theme.of(context).colorScheme.outline,
                ),
              ),
            )
          : null,
      child: widget,
    );
  }
}

class MaterialCardTile extends StatelessWidget {
  const MaterialCardTile({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 6),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
