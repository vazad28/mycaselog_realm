// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';

import '../../router/routes/routes.dart';
import '../settings.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      toolbarHeight: kMinInteractiveDimension * 1.5,
      expandedHeight: kMinInteractiveDimension * 2.5,
      titleSpacing: 0,
      elevation: 0,
      pinned: true,
      title: SizedBox(
        height: kMinInteractiveDimension,
        child: ListTile(
          trailing: const UserAvatarMiniWidget(),
          onTap: () => const UserProfileRoute().push<void>(context),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.2,
        title: InkWell(
          onTap: () {
            const UserProfileRoute().push<void>(context);
          },
          child: Row(
            children: [
              Text(
                'Settings',
                style: theme.textTheme.headlineSmall
                    ?.apply(color: theme.colorScheme.onPrimaryContainer),
              )
            ],
          ),
        ),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
      ),
    );
  }
}
