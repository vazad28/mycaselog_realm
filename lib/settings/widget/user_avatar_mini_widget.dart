import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';

import '../../core/providers/providers.dart';

class UserAvatarMiniWidget extends ConsumerWidget with LoggerMixin {
  const UserAvatarMiniWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationUser = ref.watch(authenticationUserProvider);

    final avatarWidget = authenticationUser.photo == null
        ? const Icon(
            Icons.person,
            size: kMinInteractiveDimension,
          )
        : FadeInImageWithPlaceholder(
            image: MediaCacheManager(
              authenticationUser.photo!,
              errorListener: (err) {
                logger.severe(err);
              },
            ),
            placeholder: const Spinner(
              dimension: kMinInteractiveDimension * 0.5,
            ),
            fit: BoxFit.cover,
          );

    return ClipOval(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.2),
        child: SizedBox.square(
          dimension: kMinInteractiveDimension,
          child: avatarWidget,
        ),
      ),
    );
  }
}
