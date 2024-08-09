import 'dart:convert' show LineSplitter;
import 'dart:io' show File;

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

class SahLabelOcr<T> extends StatefulWidget {
  const SahLabelOcr({required this.model, super.key});

  final T model;

  @override
  State<SahLabelOcr> createState() => _SahLabelOcrState<T>();
}

class _SahLabelOcrState<T> extends State<SahLabelOcr>
    with WidgetsBindingObserver {
  bool _isPermissionGranted = false;

  // Add this controller to be able to control de camera
  CameraController? _cameraController;

  late final Future<void> _future;

  final textRecognizer = TextRecognizer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _future = _requestCameraPermission();
  }

  // We should stop the camera once this widget is disposed
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    textRecognizer.close();
    super.dispose();
  }

  // Starts and stops the camera according to the lifecycle of the app
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController != null &&
        _cameraController!.value.isInitialized) {
      _startCamera();
    }
  }

  /// Widget builder method
  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _future,
        builder: (context, snapshot) => _SahLabelOcrView(this),
      );

  /// ///////////////////////////////////////////////////////////
  /// controller methods
  /// ///////////////////////////////////////////////////////////
  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  void _startCamera() {
    if (_cameraController != null) {
      _cameraSelected(_cameraController!.description);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) _cameraController?.dispose();
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) return;

    // Select the first rear camera.
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }

    if (camera != null) _cameraSelected(camera);
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) return;

    setState(() {});
  }

  // Future<void> _pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile == null) return;

  //   final file = File(pickedFile.path);
  //   final inputImage = InputImage.fromFile(file);
  //   final recognizedText = await textRecognizer.processImage(inputImage);

  //   if (!mounted) return;

  //   if (recognizedText.text.isEmpty) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('No OCR text')));
  //   }

  //   _createReturnModel(recognizedText);
  // }

  Future<void> _scanImage() async {
    if (_cameraController == null) return;

    try {
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);

      if (!mounted) return;

      if (recognizedText.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No OCR text')));
      }

      debugPrint(recognizedText.text);

      _createReturnModel(recognizedText);
    } catch (e) {
      debugPrint(e.toString().toUpperCase());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('An error occurred when scanning text'),
          ),
        );
      }
    }
  }

  void _createReturnModel(RecognizedText recognizedText) {
    if (T == PatientModel) {
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
      mrn: extractMrn(recognizedText.text),
    );

    Navigator.of(context).pop(decryptedPatientModel);
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

  String _extractGender(String text) {
    final genderRegex = RegExp('(M|F|male|female)', caseSensitive: false);
    final match = genderRegex.firstMatch(text);

    if (match == null) return text.substring(text.length - 1);

    final gender = switch (match.group(0)!) {
      'M' || 'male' => 'Male',
      'F' || 'female' => 'Female',
      String() => 'NA',
    };

    return gender;
  }

  void _ocrToPatientModelSah(RecognizedText recognizedText) {
    final blocks = recognizedText.blocks;
    if (blocks.isEmpty) return;

    final nameLine = blocks[1].lines.first.text;
    final name = _extractName(nameLine);
    final lastLine = blocks.last.lines.last.text;

    final patientModel = (widget.model as PatientModel)
      ..mrn = lastLine.substring(3, lastLine.indexOf(' '))
      ..yob = _extractYob(lastLine)
      ..gender = _extractGender(lastLine)
      ..name = name
      ..initials = name.initials;

    Navigator.of(context).pop(patientModel);
  }

  /// extract MRN from recognized text
  String extractMrn(String str) {
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
  String _extractYob(String paragraph) {
    final regex = RegExp(r'\d{2}/\d{2}/\d{4}'); // Pattern for 'mm/dd/yyyy'
    final match = regex.firstMatch(paragraph);
    if (match == null) {
      return 'No date found in the label';
    }

    final dob = match.group(0)!; // Extract the captured group (full match)
    return dob.split('/').last;
  }
}

/// SahLabelOcr VIEW Widget
class _SahLabelOcrView extends StatelessWidget {
  const _SahLabelOcrView(_SahLabelOcrState ocrState) : _state = ocrState;

  final _SahLabelOcrState _state;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Show the camera feed behind everything
        if (_state._isPermissionGranted)
          FutureBuilder<List<CameraDescription>>(
            future: availableCameras(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _state._initCameraController(snapshot.data!);

                return Center(
                  child: CameraPreview(_state._cameraController!),
                );
              } else {
                return const LinearProgressIndicator();
              }
            },
          ),
        Scaffold(
          appBar: AppBar(
              // title: const Text('Text Recognition Sample'),
              ),
          // Set the background to transparent so you can see the camera preview
          backgroundColor:
              _state._isPermissionGranted ? Colors.transparent : null,
          body: _state._isPermissionGranted
              ? Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _state._scanImage,
                          child: const Text('Scan label'),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: const Text(
                      'Camera permission denied',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}


/// SahLabelOcr VIEW Widget
// class _SahLabelOcrView extends StatelessWidget {
//   const _SahLabelOcrView(_SahLabelOcrState ocrState) : _state = ocrState;

//   final _SahLabelOcrState _state;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(),
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 30),
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: _state._pickImage,
//                 child: const Text('scan'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
