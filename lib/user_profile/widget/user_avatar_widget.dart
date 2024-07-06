import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_manager/media_manager.dart';

import '../provider/user_profile_provider.dart';

class UserAvatarWidget extends ConsumerWidget
    with UserProfileEventMixin, UserProfileStateMixin {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final photoUrl = userProfilePhotoUrl(ref);

    return Center(
      child: Stack(
        children: [
          buildImage(context, photoUrl),
          Positioned(
            bottom: 0,
            right: 4,
            child: PopupMenuButton(
              child: Container(
                margin: EdgeInsets.zero,
                child: buildEditIcon(colorScheme),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: ImageSource.camera,
                  onTap: () => uploadAvatar(ref, ImageSource.camera),
                  child: Text(ImageSource.camera.name),
                ),
                PopupMenuItem(
                  value: ImageSource.gallery,
                  onTap: () => uploadAvatar(ref, ImageSource.gallery),
                  child: Text(ImageSource.gallery.name),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context, String? photoUrl) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: photoUrl == null
            ? ColoredBox(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.05),
                child: const Icon(
                  Icons.person,
                  size: 128,
                ),
              )
            : Ink.image(
                image: MediaCacheManager(
                  photoUrl,
                ),
                fit: BoxFit.cover,
                width: 128,
                height: 128,
              ),
      ),
    );
  }

  Widget buildEditIcon(ColorScheme colorScheme) => buildCircle(
        color: colorScheme.surface,
        all: 3,
        child: buildCircle(
          color: colorScheme.primary,
          all: 8,
          child: Icon(
            Icons.photo_camera,
            color: colorScheme.onPrimary,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
