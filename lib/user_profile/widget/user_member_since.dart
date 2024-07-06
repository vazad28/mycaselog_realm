import 'package:app_extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile.dart';

class UserMemberSinceWidget extends ConsumerWidget with UserProfileStateMixin {
  const UserMemberSinceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberSync = userMemberSince(ref);

    final time = memberSync?.formatMDY();

    return Text(
      "member since : ${time ?? 'very early on'}",
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}
