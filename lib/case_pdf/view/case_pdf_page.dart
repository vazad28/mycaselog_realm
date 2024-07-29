import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/app_mixins.dart';
import '../../core/core.dart';
import '../provider/case_pdf_provider.dart';
import 'case_pdf_preview.dart';

/// CasePdfPage ROOT Widget
class CasePdfPage extends ConsumerStatefulWidget {
  const CasePdfPage({required this.caseID, super.key});

  final String caseID;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CasePdfPageController();
}

/// CasePdfPage CONTROLLER Widget
class _CasePdfPageController extends ConsumerState<CasePdfPage> with AppMixins {
  int? currentPage = 0;
  String errorMessage = '';
  bool isReady = false;
  int? pages = 0;

  DialogService get dialogService => ref.read(dialogServiceProvider);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => hideBottomNavbar(ref));
  }

  @override
  Widget build(BuildContext context) {
    final casePdfState =
        ref.watch(casePdfNotifierProvider(widget.caseID, Theme.of(context)));

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        showBottomNavbar(ref);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pdf Document'),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => shareFile(casePdfState.value?.pdfFile),
            )
            // PdfPrintAction(jobName: '${widget.caseID}-pdf file'),
            // PdfShareAction(filename: '${widget.caseID}-pdf file'),
          ],
        ),
        body: AsyncValueWidget(
          value: casePdfState,
          data: (casePdfModel) {
            try {
              return _CasePdfPageView(this, casePdfModel);
            } catch (err) {
              return Center(
                child: Text(err.toString()),
              );
            }
          },
        ),
      ),
    );
  }

  /// controller methods
  void onRender(int? pdfPages) {
    setState(() {
      pages = pdfPages;
      isReady = true;
    });
  }

  Future<void> shareFile(File? pdfFile) async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    try {
      if (pdfFile == null) throw Exception('Pdf file not available');

      final result =
          await dialogService.shareFile([pdfFile.path], 'Pdf case file');

      await result.when(
        failure: (l) => throw Exception(l.toLocalizedString()),
        success: (shareResult) =>
            Future<void>.delayed(const Duration(milliseconds: 500))
                .then((value) {
          if (shareResult.status == ShareResultStatus.success) {
            dialogService.showSnackBar('success');
          }
        }),
      );
    } catch (err) {
      dialogService.showSnackBar('Error in sharing case pdf file');
    }
  }
}

/// CasePdfPage VIEW Widget
class _CasePdfPageView extends WidgetView<CasePdfPage, _CasePdfPageController> {
  const _CasePdfPageView(super.state, CasePdfModel casePdfModel)
      : _casePdfModel = casePdfModel;

  final CasePdfModel _casePdfModel;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      maxPageWidth: 700,
      canDebug: false,
      useActions: false,
      actionBarTheme: const PdfActionBarTheme(
        crossAxisAlignment: WrapCrossAlignment.start,
      ),
      build: (format) => makeCasePdf(
        casePdfModel: _casePdfModel,
        pdfPageFormat: format,
        themeData: Theme.of(context),
      ),
      //actions: actions,
    );
  }
}
