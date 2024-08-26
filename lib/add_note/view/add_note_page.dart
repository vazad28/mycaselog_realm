import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../../core/core.dart';
import '../../router/router.dart';
import '../quill/note_quill_editor.dart';
import '../quill/quill_toolbar_bottom.dart';
import '../quill/quill_toolbar_top.dart';
import 'fonts_loader.dart';

part '../widget/note_app_bar.dart';

final FontsLoader loader = FontsLoader();

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({
    required this.noteID,
    this.newRecord = false,
    super.key,
  });

  final String noteID;
  final bool newRecord;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> with LoggerMixin {
  final _controller = QuillController.basic();

  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();
  final _titleFieldController = TextEditingController();
  final PDFPageFormat params = PDFPageFormat.letter;

  final bool _canPop = false;
  bool _editorHasFocus = false;

  bool _documentLoaded = false;
  late NoteModel _noteModel;

  @override
  void initState() {
    super.initState();
    _editorFocusNode.addListener(() {
      if (_editorHasFocus != _editorFocusNode.hasFocus) {
        setState(() {
          _editorHasFocus = !_editorHasFocus;
        });
      }
    });

    // to prevent error
    // dependOnInheritedElement() was called before initstate() in flutter
    // and to let page animation to finish smoothly
    Future<void>.delayed(Durations.long2).then((_) {
      _loadDocument();
    });
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(
        title: !_documentLoaded
            ? const Loading(
                text: '',
              )
            : QuillToolbarTop(
                key: const Key('__add_note_quill_editor_top bar_key__'),
                quillController: _controller,
              ),
        actions: [
          SubmitFormWidget(
            future: _doSubmit,
          ),
        ],
      ),
      bottomSheet: AnimatedContainer(
        height: _editorHasFocus ? kMinInteractiveDimension : 0,
        duration: Durations.medium4,
        child: QuillToolbarBottom(
          quillController: _controller,
        ),
      ),
      body: !_documentLoaded
          ? const Loading()
          : Column(
              children: [
                TextFormField(
                  controller: _titleFieldController,
                  maxLines: null,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Title of your note',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  onTapOutside: (_) => primaryFocus?.unfocus(),
                ),
                Builder(
                  builder: (context) {
                    return Expanded(
                      child: NoteQuillEditor(
                        quillController: _controller,
                        configurations: const QuillEditorConfigurations(),
                        scrollController: _editorScrollController,
                        focusNode: _editorFocusNode,
                      ),
                    );
                  },
                ),
              ],
            ),
    );

    return FormPopScopeWrapper(
      key: const Key('__add_note_page_form_pop_scope_wrapper_key__'),
      canPop: canPop,
      visibilitySwitcher: (visibility) {
        ref
            .watch(bottomNavVisibilityProvider.notifier)
            .update(value: visibility);
      },
      routeObserver: ref.read(shellRoutesObserversProvider).notesRouteObserver,
      child: scaffold,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    _titleFieldController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   final scaffold = Scaffold(
  //     appBar: AppBar(
  //       title: QuillToolbarTop(
  //         quillController: _controller,
  //       ),
  //       actions: [
  //         SubmitFormWidget(
  //           future: _doSubmit,
  //         ),
  //         MenuAnchor(
  //           builder: (context, controller, child) {
  //             return IconButton(
  //               onPressed: () {
  //                 if (controller.isOpen) {
  //                   controller.close();
  //                   return;
  //                 }
  //                 controller.open();
  //               },
  //               icon: const Icon(
  //                 Icons.more_vert,
  //               ),
  //             );
  //           },
  //           menuChildren: [
  //             MenuItemButton(
  //               child: const Icon(Icons.delete),
  //               onPressed: () {
  //                 ref
  //                     .watch(dbProvider)
  //                     .notesCollection
  //                     .deleteNote(_noteModel)
  //                     .then((res) {
  //                   if (context.mounted) Navigator.of(context).pop();
  //                 });
  //               },
  //             ),
  //             // MenuItemButton(
  //             //   onPressed: () async {
  //             //     await loader.loadFonts();
  //             //     final pdfConverter = PDFConverter(
  //             //       backMatterDelta: null,
  //             //       frontMatterDelta: null,
  //             //       //customConverters: [],
  //             //       document: _controller.document.toDelta(),
  //             //       fallbacks: [...loader.allFonts()],
  //             //       onRequestBoldFont: (String fontFamily) async {
  //             //         return loader.getFontByName(
  //             //           fontFamily: fontFamily,
  //             //           bold: true,
  //             //         );
  //             //       },
  //             //       onRequestBoldItalicFont: (String fontFamily) async {
  //             //         return loader.getFontByName(
  //             //           fontFamily: fontFamily,
  //             //           bold: true,
  //             //           italic: true,
  //             //         );
  //             //       },
  //             //       onRequestFallbackFont: (String fontFamily) async {
  //             //         return null;
  //             //       },
  //             //       onRequestItalicFont: (String fontFamily) async {
  //             //         return loader.getFontByName(
  //             //           fontFamily: fontFamily,
  //             //           italic: true,
  //             //         );
  //             //       },
  //             //       onRequestFont: (String fontFamily) async {
  //             //         return loader.getFontByName(fontFamily: fontFamily);
  //             //       },
  //             //       params: params,
  //             //       pageFormat: null,
  //             //     );

  //             //     final pdfDocument = await pdfConverter.createDocument();

  //             //     if (pdfDocument == null && context.mounted) {
  //             //       ScaffoldMessenger.of(context).showSnackBar(
  //             //         const SnackBar(
  //             //           content: Text(
  //             //             'The file cannot be generated by an unknown error',
  //             //           ),
  //             //         ),
  //             //       );
  //             //       return;
  //             //     }

  //             //     await Printing.layoutPdf(
  //             //       onLayout: (format) async => pdfDocument!.save(),
  //             //     );
  //             //   },
  //             //   child: const Text('Print as PDF'),
  //             // ),
  //           ],
  //         ),
  //       ],
  //     ),
  //     bottomSheet: AnimatedContainer(
  //       height: _editorHasFocus ? kMinInteractiveDimension : 0,
  //       duration: Durations.medium4,
  //       child: QuillToolbarBottom(
  //         quillController: _controller,
  //       ),
  //     ),
  //     body: !_documentLoaded
  //         ? const Loading()
  //         : Column(
  //             children: [
  //               TextFormField(
  //                 controller: _titleFieldController,
  //                 maxLines: null,
  //                 style: context.textTheme.titleLarge?.copyWith(
  //                   color: context.colorScheme.onSurfaceVariant,
  //                 ),
  //                 textCapitalization: TextCapitalization.words,
  //                 keyboardType: TextInputType.text,
  //                 decoration: const InputDecoration(
  //                   border: InputBorder.none,
  //                   enabledBorder: InputBorder.none,
  //                   hintText: 'Title of your note',
  //                   floatingLabelBehavior: FloatingLabelBehavior.auto,
  //                 ),
  //                 onTapOutside: (_) => primaryFocus?.unfocus(),
  //               ),
  //               Builder(
  //                 builder: (context) {
  //                   return Expanded(
  //                     child: NoteQuillEditor(
  //                       quillController: _controller,
  //                       configurations: QuillEditorConfigurations(
  //                         sharedConfigurations: _sharedConfigurations,
  //                       ),
  //                       scrollController: _editorScrollController,
  //                       focusNode: _editorFocusNode,
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ],
  //           ),
  //   );

  //   return FormPopScopeWrapper(
  //     key: const Key('__add_note_page_form_pop_scope_wrapper_key__'),
  //     canPop: canPop,
  //     visibilitySwitcher: (visibility) {
  //       ref
  //           .watch(bottomNavVisibilityProvider.notifier)
  //           .update(value: visibility);
  //     },
  //     routeObserver: ref.read(shellRoutesObserversProvider).notesRouteObserver,
  //     child: scaffold,
  //   );
  // }

  bool canPop() {
    /// when form is submitted this is set to true before pop is fired so that
    /// on ScreenPop  this allows pop
    if (_canPop) return true;

    if (widget.newRecord) {
      if (_titleFieldController.text.isNotEmpty ||
          _controller.document.toPlainText().trim().isNotEmpty) return false;
      return true;
    }

    if (_titleFieldController.text != _noteModel.title) return false;

    if (_noteModel.note != null) {
      final noteEqual = _controller.document.toJsonString == _noteModel.note;
      return noteEqual;
    }

    if (_noteModel.note == null) {
      return _controller.document.toPlainText().trim().isEmpty;
    }

    return true;
  }

  // /// ---- DO the form submit  ---
  Future<void> _doSubmit() async {
    try {
      final authorID = ref.read(authenticationUserProvider).id;

      final noteModelUnmanaged = NoteModelX.fromJson(_noteModel.toJson())
        ..authorID = authorID
        ..title = _titleFieldController.text
        ..note = _controller.document.toJsonString()
        ..noteText = _controller.document
            .toPlainText(); //<-for serach. note to/from firestore storage

      await ref.watch(dbProvider).notesCollection.add(noteModelUnmanaged);

      await Future<void>.delayed(Durations.medium4);

      if (!context.mounted) return;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (err) {
      logger.severe(err);
    }
  }

  void _loadDocument() {
    _noteModel =
        ref.watch(dbProvider).notesCollection.getSingle(widget.noteID) ??
            NoteModelX.zero();
    _controller.document = _noteModel.quillDocument;

    if (_noteModel.title != null) {
      _titleFieldController.value = TextEditingValue(text: _noteModel.title!);
    }

    setState(() {
      _documentLoaded = true;
    });
  }
}
