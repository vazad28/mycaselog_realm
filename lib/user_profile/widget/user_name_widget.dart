import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile.dart';

class UserNameMiniWidget extends ConsumerWidget
    with UserProfileEventMixin, UserProfileStateMixin {
  const UserNameMiniWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = userDisplayName(ref);

    return Text(
      displayName ?? 'Hello User',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color),
    );
  }
}

class UserNameWidget extends ConsumerStatefulWidget {
  const UserNameWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserNameWidgetState();
}

class _UserNameWidgetState extends ConsumerState<UserNameWidget>
    with UserProfileEventMixin, UserProfileStateMixin {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = userDisplayName(ref) ?? '';

    final theme = Theme.of(context);
    final child = TextFormField(
      autocorrect: false,
      textAlign: TextAlign.center,
      controller: _controller,
      textAlignVertical: TextAlignVertical.bottom,
      style: theme.textTheme.headlineSmall,
      textInputAction: TextInputAction.done,
      decoration: context
          .inputDecorOutlineNoBorder(hintText: 'Your Name')
          .copyWith(contentPadding: const EdgeInsets.all(4)),
      // onChanged: (value) =>
      //     ref.watch(_textFieldProvider.notifier).state = value,
    );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Focus(
        onFocusChange: (isFocused) {
          if (isFocused == false) {
            updateDisplayName(ref, _controller.text);
          }
        },
        child: child,
      ),
    );
  }
}
