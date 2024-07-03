import 'package:flutter/material.dart';

import 'material_card.dart';

/// swrapper of list of settings tiles
class SettingSectionWrapper extends StatelessWidget {
  const SettingSectionWrapper({
    required this.children,
    super.key,
    this.outlined = true,
    this.title,
  });

  final List<Widget> children;
  final bool outlined;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final items = children.map((e) => e).toList(growable: true);

    if (title != null) items.insert(0, SettingsTileHeader(title: title!));
    if (outlined) items.add(const SizedBox(height: 8));

    final Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: items,
    );

    if (outlined) {
      return MaterialCard.outlined(
        padding: EdgeInsets.zero,
        margin: kTabLabelPadding,
        child: child,
      );
    }

    return child;
  }
}

/// settings tile divider
class SettingsTileHeader extends StatelessWidget {
  const SettingsTileHeader({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                letterSpacing: 1.2,
              ),
        ),
      ),
    );
  }
}

/// settings tile widget
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.title,
    super.key,
    this.subTitle,
    this.onTap,
    this.trailing,
    this.leading,
  });

  final Widget? leading;
  final GestureTapCallback? onTap;
  final String? subTitle;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final listTile = ListTile(
      visualDensity: VisualDensity.comfortable,
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: subTitle == null
          ? null
          : Text(
              subTitle!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
      trailing: trailing,
      leading: leading,
    );
    return onTap == null ? listTile : InkWell(onTap: onTap, child: listTile);
  }
}

/// setting tile for toggle type
class SettingToggleTile extends StatelessWidget {
  const SettingToggleTile({
    required this.switchValue,
    required this.onToggle,
    super.key,
    this.title,
    this.subTitle,
    this.dense = false,
    this.leading,
  });

  final bool? dense;
  final Widget? leading;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool) onToggle;
  final String? subTitle;
  final bool switchValue;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      dense: dense,
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      secondary: leading,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: subTitle == null
          ? null
          : Text(
              subTitle!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
      value: switchValue,
      onChanged: onToggle,
    );
  }
}

/// settings tile divider
class SettingsTileDivider extends StatelessWidget {
  const SettingsTileDivider({super.key, this.full = false});

  final bool full;

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: full ? 0.0 : 64.0,
      height: 1,
      thickness: 0.5,
    );
  }
}

/// setting stile trailign widget
class SettingsTrailing extends StatelessWidget {
  const SettingsTrailing({super.key, this.text, this.icon});

  final Icon? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.titleSmall,
    );
    // return Expanded(
    //     child: Row(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       text ?? '',
    //       style: Theme.of(context).textTheme.titleSmall,
    //     ),
    //     if (icon != null) const SizedBox(width: 4),
    //     if (icon != null) icon!,
    //   ],
    // ));
  }
}
