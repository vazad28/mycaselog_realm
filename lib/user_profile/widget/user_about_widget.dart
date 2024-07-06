import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile.dart';

class UserAboutWidget extends ConsumerStatefulWidget {
  const UserAboutWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserAboutWidgetState();
}

class _UserAboutWidgetState extends ConsumerState<UserAboutWidget>
    with UserProfileEventMixin, UserProfileStateMixin {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = userAboutMe(ref) ?? '';

    final child = TextFormField(
      autocorrect: false,
      maxLines: null,
      textAlignVertical: TextAlignVertical.bottom,
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: TextInputAction.done,
      controller: _controller,
      decoration: context
          .inputDecorOutlineNoBorder(hintText: 'About me')
          .copyWith(contentPadding: const EdgeInsets.all(4)),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Focus(
        child: child,
        onFocusChange: (isFocused) {
          if (isFocused == false) {
            updateAbout(ref, _controller.text);
          }
        },
      ),
    );
  }
}
