import 'dart:async';

class LiveSync {
  factory LiveSync() {
    return _instance;
  }

  LiveSync._internal();
  static final LiveSync _instance = LiveSync._internal();

  final _streamController = StreamController<bool>.broadcast();

  Stream<bool> get stream => _streamController.stream;

  void updateStatus({required bool status}) {
    _streamController.add(status);
  }
}
