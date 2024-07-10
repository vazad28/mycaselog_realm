import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/providers/sync_providers.dart';

part '../../generated/start_up/provider/start_up_provider.g.dart';

/// Dont change because in custom claims the passcode is stored using this String
/// as key
const passcodeClaimsKey = 'mclPasscode';

// https://codewithandrea.com/articles/robust-app-initialization-riverpod/
@Riverpod(keepAlive: true)
class StartUp extends _$StartUp {
  @override
  FutureOr<void> build() async {
    ref.onDispose(() {
      // ensure dependent providers are disposed as well
      ref.invalidate(passcodeProvider);
    });
    // await for all initialization code to be complete before returning
    final passcode = await _loadUserPasscode();

    /// so we have passcode. lets set this up in the provider
    ref.watch(passcodeProvider.notifier).update((_) => passcode);

    // ignore: unused_local_variable
    final syncActivate = ref.read(firestoreSyncProvider);

    //ref.watch(supportDataNotifierProvider.notifier).load();
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


/* 
try {
      final userModel = await ref
          .read(apiClientProvider)
          .remote
          .usersCollection
          .getCurrentUserModel();

      print(userModel?.toJson());
    } catch (err) {
      print(err.toString());
    } */