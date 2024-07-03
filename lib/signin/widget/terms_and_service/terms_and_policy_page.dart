import 'dart:convert';

import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // for decoding Uint8List to String

class TermsAndPolicyPage extends ConsumerStatefulWidget {
  const TermsAndPolicyPage({
    super.key,
    this.showBottomBar = false,
    this.controller,
  });

  final bool showBottomBar;
  final ScrollController? controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TermsAndPolicyPageState();
}

class _TermsAndPolicyPageState extends ConsumerState<TermsAndPolicyPage> {
  late Reference _fileRef;

  @override
  void initState() {
    super.initState();

    final storage = FirebaseStorage.instance;
    _fileRef =
        storage.ref().child('-terms_and_policy/terms_condition_text.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: FutureBuilder<Uint8List?>(
            future: _fileRef.getData(),
            // ignore: avoid_types_on_closure_parameters
            builder: (context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState case ConnectionState.waiting) {
                return const Loading();
              } else {
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return Loading(text: S.of(context).errorLoadingData);
                }

                if (snapshot.data?.isEmpty ?? true) {
                  return Loading(text: S.of(context).dataIsNull);
                }

                final text = utf8.decode(snapshot.data!);

                if (snapshot.data != null) {
                  return SingleChildScrollView(
                    controller: widget.controller,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    child: Text(text),
                  );
                }
              }
              return const Loading();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: _okButton,
      ),
    );
  }

  Widget get _okButton => Builder(
        builder: (context) => TextButton(
          child: Text(S.of(context).ok),
          onPressed: () => Navigator.of(context).pop(),
        ),
      );
}
