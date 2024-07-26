import 'dart:async';

import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';

part '../../generated/user_profile/widget/signout_button.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Signout loading spinner provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class SignOutButtonNotifier extends _$SignOutButtonNotifier {
  @override
  bool build() => false;
  // ignore: avoid_positional_boolean_parameters
  bool update({required bool value}) => state = value;
}

class SignOutButton extends ConsumerStatefulWidget {
  const SignOutButton({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends ConsumerState<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(signOutButtonNotifierProvider);

    return AppButton(
      text: loading ? null : S.of(context).signOut,
      onPressed: _signOut,
      cupertinoIcon: CupertinoIcons.arrow_right_circle,
      materialIcon: Icons.logout,
      buttonType: ButtonType.text,
      child: loading ? const Spinner() : null,
    );
  }

  Future<void> _signOut() async {
    try {
      ref.watch(signOutButtonNotifierProvider.notifier).update(value: true);

      ref.watch(logoutProvider);
    } catch (err) {
      if (!mounted) return;
      ref.watch(signOutButtonNotifierProvider.notifier).update(value: false);
      context.showSnackBar(S.of(context).signOutFailure);
    }
  }
}
