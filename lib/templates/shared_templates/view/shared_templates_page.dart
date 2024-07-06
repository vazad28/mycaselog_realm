import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../shared_templates.dart';

class SharedTemplatesPage extends ConsumerWidget {
  const SharedTemplatesPage({required this.speciality, super.key});

  final String speciality;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          speciality.replaceAll('_', ' ').titleCase,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kMinInteractiveDimension * .75),
          child: SizedBox(
            height: kMinInteractiveDimension,
            width: double.infinity,
            child: Center(
              child: Text(
                'Select a shared template to import',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: SharedTemplatesView(speciality: speciality),
    );
  }
}
