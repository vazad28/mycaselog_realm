import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CasesAppBar extends StatelessWidget {
  const CasesAppBar({super.key});

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
                'Surgery Cases',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(letterSpacing: -1),
              ),
            ),
            //const _CasesCountWidget(),
            // const SizedBox(width: 16)
          ],
        ),
      ),
    );
  }
}
