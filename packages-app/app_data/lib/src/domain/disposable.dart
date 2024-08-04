import 'dart:async';

extension StreamSubscriptionX on StreamSubscription {
  void cancelOnDisposeOf(Disposable disposable) => disposable.onDispose(cancel);
}

class Disposable {
  final _disposers = <Future<void> Function()>[];

  Future<void> dispose() async {
    for (final disposer in _disposers) {
      await disposer();
    }
  }

  void onDispose(Future<void> Function() disposer) => _disposers.add(disposer);
}
