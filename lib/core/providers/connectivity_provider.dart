part of '../app_providers.dart';

@Riverpod(keepAlive: true)
class ConnectivityStatus extends _$ConnectivityStatus {
  @override
  bool build() {
    final sub = Connectivity().onConnectivityChanged.listen((results) {
      final status = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);
      if (status == state) return;

      ref
          .watch(dialogServiceProvider)
          .showSnackBar(status ? 'Network connected' : 'No network connection');
    });

    ref.onDispose(() => sub.cancel);

    return true;
  }
}
