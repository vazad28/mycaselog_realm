import 'package:flutter/material.dart';

import 'loading.dart';

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {}, //prevents taps inside the sheet from popping it
        onVerticalDragStart: (_) {}, //prevents dragging down from popping it
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,
            alignment: Alignment.center,
            child: Loading(
              showSpinner: true,
              text: text ?? 'please wait..',
            ),
          ),
        ),
      ),
    );
  }
}
