import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/passcode/provider/passcode_provider.g.dart';

/// *** Dont change ***
/// Custom Claims the passcode is stored using this String as key
const passcodeClaimsKey = 'mclPasscode';

@riverpod
class PasscodeNotifier extends _$PasscodeNotifier {
  @override
  Future<String> build() async {
    /// await for all initialization code to be complete before returning
    final passcode = await _loadUserPasscode();
    //rint('passcode $passcode');
    /// so we have passcode. lets set this up in the provider
    ref.watch(passcodeProvider.notifier).update((_) => passcode);
    return passcode;
  }

  /// Method will check custom claims to see if the passcode exist in the
  /// user clustom claims object created at the  time of account creation
  /// Retry 10 times or else throw error
  Future<String> _loadUserPasscode() async {
    var count = 0;
    while (true) {
      debugPrint('checking user passcode in custom claims with count $count');
      if (count > 10) {
        throw Error.throwWithStackTrace(
          'Getting user details timed out',
          StackTrace.current,
        );
      }
      final tokenResult = await ref
          .read(firebaseAuthInstanceProvider)
          .currentUser
          ?.getIdTokenResult(count.isOdd); //set to true for refreshing token

      if (tokenResult?.claims?.containsKey(passcodeClaimsKey) ?? false) {
        final passcode = tokenResult!.claims![passcodeClaimsKey] as String?;
        if (passcode?.isEmpty ?? true) {
          throw Error.throwWithStackTrace(
            'No passcode set for user',
            StackTrace.current,
          );
        }
        return passcode!;
      }
      count++;
      await Future<void>.delayed(Durations.extralong4 * 2);
    }
  }
}
