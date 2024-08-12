import 'dart:convert' show LineSplitter;
import 'dart:io' show File;

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class SahLabelOcr<T> extends StatefulWidget {
  const SahLabelOcr({required this.model, super.key});

  final T model;

  @override
  State<SahLabelOcr> createState() => _SahLabelOcrState<T>();
}

class _SahLabelOcrState<T> extends State<SahLabelOcr>
    with WidgetsBindingObserver {
  final textRecognizer = TextRecognizer();

  /// Widget builder method
  @override
  Widget build(BuildContext context) => _SahLabelOcrView(this);

  /// ///////////////////////////////////////////////////////////
  /// controller methods
  /// ///////////////////////////////////////////////////////////
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final file = File(pickedFile.path);
    final inputImage = InputImage.fromFile(file);
    final recognizedText = await textRecognizer.processImage(inputImage);

    if (!mounted) return;

    if (recognizedText.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No OCR text')));
    }

    _createReturnModel(recognizedText);
  }

  void _createReturnModel(RecognizedText recognizedText) {
    if (T == PatientModel) {
      //return _ocrToPatientModelSah(recognizedText);
      return _ocrToPatientModelSah(recognizedText);
    } else if (T == DecryptedPatientModel) {
      return _ocrToDecryptedPatientModel(recognizedText);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No return model for OCR provided'),
          ),
        );
      }
    }
  }

  void _ocrToDecryptedPatientModel(RecognizedText recognizedText) {
    final textArray = const LineSplitter().convert(recognizedText.text);
    if (textArray.isEmpty) throw Exception('Could not read label');

    final decryptedPatientModel = DecryptedPatientModel.zero().copyWith(
      name: _extractName(textArray.first),
      mrn: extractMrn(recognizedText),
    );

    Navigator.of(context).pop(decryptedPatientModel);
  }

  void _ocrToPatientModelSah(RecognizedText recognizedText) {
    final blocks = recognizedText.blocks;
    if (blocks.isEmpty) return;

    final nameLine = blocks[1].lines.first.text;
    //print('name is - $nameLine');
    final name = _extractName(nameLine);
    //print('name is - $name');

    final patientModel = (widget.model as PatientModel)
      ..mrn = extractMrn(recognizedText)
      ..yob = _extractYob(recognizedText)
      ..gender = _extractGender(recognizedText)
      ..name = name
      ..initials = name.initials;

    Navigator.of(context).pop(patientModel);
  }

  String? _extractName(String paragraph) {
    final match = RegExp(r'(\w+)\,(\w+)(?: ([\w ]+))?').firstMatch(paragraph);
    if (match == null) return null;

    final lastName = match.group(1)!;
    final firstName = match.group(2);
    final middleName = match.group(3);

    final name = middleName != null
        ? '$lastName, $firstName $middleName'
        : '$lastName, $firstName';

    final regex =
        RegExp(r'\b\w+\d+\b', caseSensitive: false); // Match words with numbers
    return name.replaceAll(regex, '');
  }

  String _extractGender(RecognizedText recognizedText) {
    final genderRegex = RegExp('(M|F|male|female)', caseSensitive: false);
    final match = genderRegex.firstMatch(recognizedText.text);

    if (match == null) return '';

    final gender = switch (match.group(0)!) {
      'M' || 'male' => 'Male',
      'F' || 'female' => 'Female',
      String() => 'NA',
    };

    return gender;
  }

  /// extract MRN from recognized text
  String extractMrn(RecognizedText recognizedText) {
    final str = recognizedText.text;
    final regex = RegExp(
      r'SA\w{8}',
    ); // Regular expression for SA followed by 8 word characters
    final match = regex.firstMatch(str.replaceAll(' ', ''));

    if (match == null) {
      return 'No string starting with SA and 8 characters found';
    }

    return match.group(0)!;
  }

  /// get date
  String _extractYob(RecognizedText recognizedText) {
    final regex = RegExp(r'\d{2}/\d{2}/\d{4}');
    final matches = regex.allMatches(recognizedText.text);
    return matches.isEmpty ? '' : matches.last.group(0)!.split('/').last;
  }
}

/// SahLabelOcr VIEW Widget
class _SahLabelOcrView extends StatelessWidget {
  const _SahLabelOcrView(_SahLabelOcrState ocrState) : _state = ocrState;

  final _SahLabelOcrState _state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Text Recognition Sample'),
          ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(
              child: ElevatedButton(
                onPressed: _state._pickImage,
                child: const Text('Scan label'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
