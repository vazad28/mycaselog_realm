import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class MediaAppBar extends StatelessWidget {
  const MediaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      titleSpacing: 4,
      elevation: 0,
      pinned: false,
      surfaceTintColor: context.colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsetsDirectional.only(start: 24, bottom: 16),
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Surgery Media',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(letterSpacing: -1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
