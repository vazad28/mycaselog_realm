import 'package:flutter/material.dart';

typedef KeyboardPositionListener = void Function(double position);

class KeyboardAppearenceListener extends StatefulWidget {
  const KeyboardAppearenceListener({
    required this.child, required this.listener, super.key,
  });

  final Widget child;
  final KeyboardPositionListener listener;

  @override
  State<KeyboardAppearenceListener> createState() => _KeyboardAppearenceListenerState();
}

class _KeyboardAppearenceListenerState extends State<KeyboardAppearenceListener> {
  @override
  void didChangeDependencies() {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    widget.listener(bottom);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
