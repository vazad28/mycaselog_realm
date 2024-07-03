import 'package:flutter/material.dart';

class CenterFormWrapper extends StatelessWidget {
  const CenterFormWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
              child: Container(
            constraints: (constraints.maxWidth < 600)
                ? const BoxConstraints(maxWidth: 450)
                : const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: child,
          ),);
        },
      ),
    );
  }
}
