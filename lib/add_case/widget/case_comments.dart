import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:misc_packages/misc_packages.dart';

class CaseComments extends StatefulWidget {
  const CaseComments({required this.comments, super.key});

  final String? comments;

  @override
  State<CaseComments> createState() => _CaseCommentsState();
}

class _CaseCommentsState extends State<CaseComments> {
  final TextEditingController ctrl = TextEditingController();

  @override
  void initState() {
    ctrl.text = widget.comments ?? '';
    super.initState();
  }

  void _deleteComment() {
    context.showConfirmDialog(S.of(context).areYouSure).then((value) {
      if (!value) return;
      if (context.mounted) Navigator.of(context).pop('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).comments),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _deleteComment,
          ),
          IconButton(
            icon: const Icon(Icons.cloud),
            onPressed: () => Navigator.pop(context, ctrl.text),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextField(
          maxLines: null,
          autofocus: true,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'add comment..',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          controller: ctrl,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
