import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile.dart';

class UserSubSpecialityWidget extends ConsumerStatefulWidget {
  const UserSubSpecialityWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserSubSpecialityWidgetState();
}

class _UserSubSpecialityWidgetState
    extends ConsumerState<UserSubSpecialityWidget>
    with UserProfileEventMixin, UserProfileStateMixin {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = userSubSpeciality(ref) ?? '';

    final child = TextFormField(
      controller: _controller,
      autocorrect: false,
      maxLines: null,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.bottom,
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: TextInputAction.done,
      decoration: context
          .inputDecorOutlineNoBorder(hintText: 'Your sub-speciality')
          .copyWith(contentPadding: const EdgeInsets.all(4)),
    );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: kMinInteractiveDimension * 2,
        ),
        child: Focus(
          child: child,
          onFocusChange: (isFocused) {
            if (isFocused) return;
            updateSubSpeciality(ref, _controller.text);
          },
        ),
      ),
    );
  }
}
