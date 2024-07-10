import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart' hide Rule;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../core/providers/providers.dart';
import '../../router/router.dart';
import '../quill/my_quill_editor.dart';
import '../widget/quill_toolbar_bottom.dart';
import 'fonts_loader.dart';

part '../widget/note_app_bar.dart';

final FontsLoader loader = FontsLoader();

class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({
    required this.noteModel,
    this.newRecord = false,
    super.key,
  });

  final NoteModel noteModel;
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
  final bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _controller.document = widget.noteModel.quillDocument;
    if (widget.noteModel.title != null) {
      _titleFieldController.value =
          TextEditingValue(text: widget.noteModel.title!);
    }

    _editorFocusNode.addListener(() {
      if (_editorHasFocus != _editorFocusNode.hasFocus) {
        setState(() {
          _editorHasFocus = !_editorHasFocus;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    _titleFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      appBar: AppBar(
        title: QuillToolbar(
          // ignore: avoid_redundant_argument_values
          configurations: const QuillToolbarConfigurations(),
          child: Row(
            children: [
              QuillToolbarHistoryButton(
                isUndo: true,
                controller: _controller,
              ),
              QuillToolbarHistoryButton(
                isUndo: false,
                controller: _controller,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: _doSubmit,
            icon: _isSubmitting ? const Spinner() : const Icon(Icons.check),
          ),
          MenuAnchor(
            builder: (context, controller, child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                    return;
                  }
                  controller.open();
                },
                icon: const Icon(
                  Icons.more_vert,
                ),
              );
            },
            menuChildren: [
              MenuItemButton(
                onPressed: () async {
                  await loader.loadFonts();
                  final pdfConverter = PDFConverter(
                    backMatterDelta: null,
                    frontMatterDelta: null,
                    customConverters: [],
                    document: _controller.document.toDelta(),
                    fallbacks: [...loader.allFonts()],
                    onRequestBoldFont: (String fontFamily) async {
                      return loader.getFontByName(
                        fontFamily: fontFamily,
                        bold: true,
                      );
                    },
                    onRequestBoldItalicFont: (String fontFamily) async {
                      return loader.getFontByName(
                        fontFamily: fontFamily,
                        bold: true,
                        italic: true,
                      );
                    },
                    onRequestFallbackFont: (String fontFamily) async {
                      return null;
                    },
                    onRequestItalicFont: (String fontFamily) async {
                      return loader.getFontByName(
                        fontFamily: fontFamily,
                        italic: true,
                      );
                    },
                    onRequestFont: (String fontFamily) async {
                      return loader.getFontByName(fontFamily: fontFamily);
                    },
                    params: params,
                  );

                  final pdfDocument = await pdfConverter.createDocument();

                  if (pdfDocument == null && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'The file cannot be generated by an unknown error',
                        ),
                      ),
                    );
                    return;
                  }

                  await Printing.layoutPdf(
                    onLayout: (format) async => pdfDocument!.save(),
                  );
                },
                child: const Text('Print as PDF'),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: AnimatedContainer(
        height: _editorHasFocus ? kMinInteractiveDimension : 0,
        duration: Durations.medium4,
        child: QuillToolbarBottom(
          controller: _controller,
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _titleFieldController,
            maxLines: null,
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            //onSubmitted: (control) => control.value?.trim(),
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
                child: MyQuillEditor(
                  configurations: QuillEditorConfigurations(
                    sharedConfigurations: _sharedConfigurations,
                    controller: _controller,
                  ),
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

  QuillSharedConfigurations get _sharedConfigurations {
    return const QuillSharedConfigurations();
  }

  bool canPop() {
    /// when form is submitted this is set to true before pop is fired so that
    /// on ScreenPop  this allows pop
    if (_canPop) return true;

    if (widget.newRecord) {
      if (_titleFieldController.text.isNotEmpty ||
          _controller.document.toPlainText().trim().isNotEmpty) return false;
      return true;
    }

    if (_titleFieldController.text != widget.noteModel.title) return false;

    if (widget.noteModel.note != null) {
      final noteEqual =
          _controller.document.toJsonString == widget.noteModel.note;
      return noteEqual;
    }

    if (widget.noteModel.note == null) {
      return _controller.document.toPlainText().trim().isEmpty;
    }

    return true;
  }

  /// ---- DO the form submit  ---
  Future<void> _doSubmit() async {
    try {
      final authorID = ref.read(authenticationUserProvider).id;

      final noteModelUnmanaged = NoteModelX.fromJson(widget.noteModel.toJson())
        ..authorID = authorID
        ..title = _titleFieldController.text
        ..note = _controller.document.toJsonString;

      await ref
          .watch(dbProvider)
          .notesCollection
          .put(widget.noteModel.noteID, noteModelUnmanaged.toRealmObject());

      // ref.watch(dbProvider).notesCollection.upsert(authorID, () {
      //   final model = widget.noteModel
      //     ..title = _titleFieldController.text
      //     ..note = _controller.document.toJsonString
      //     ..authorID = authorID;
      //   return model;
      // });

      await Future<void>.delayed(Durations.medium4);

      if (!context.mounted) return;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (err) {
      logger.severe(err);
    }
  }
}
