// ignore_for_file: require_trailing_commas

import 'dart:typed_data';

import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart' as m;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:recase/recase.dart';

import '../case_pdf.dart';

//ignore: non_constant_identifier_names
Widget PaddedText(
  String? text, {
  TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text ?? '',
        textAlign: align,
      ),
    );

Future<Uint8List> makeCasePdf({
  required CasePdfModel casePdfModel,
  required m.ThemeData themeData,
  PdfPageFormat? pdfPageFormat,
}) async {
  final format = pdfPageFormat ?? PdfPageFormat.letter;
  final doc = Document(pageMode: PdfPageMode.outlines);

  final basicData = casePdfModel.caseModel!;
  final patientData = casePdfModel.caseModel!.patientModel;
  var fieldsData = casePdfModel.caseModel?.fieldsData ?? <TemplateFieldModel>[];
  fieldsData = fieldsData..sort((a, b) => a.idx.compareTo(b.idx));

  final basicDataItems = basicData.toJsonForPdf();

  doc.addPage(
    MultiPage(
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: PageOrientation.portrait,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return SizedBox();
        }
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5, color: PdfColors.grey),
            ),
          ),
          child: Text(
            'Mycaselog',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      footer: (Context context) {
        return Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: Text(
            'Page ${context.pageNumber} of ${context.pagesCount}',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      build: (Context context) => <Widget>[
        Header(
          level: 0,
          title: 'Case Details - Patient Data',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Patient Details', textScaleFactor: 1.5),
              PdfLogo()
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: Text('Name : ${patientData?.initials}')),
            Expanded(child: Text('Gender : ${patientData?.gender}')),
            Expanded(child: Text('Birth Year: ${patientData?.yob}')),
          ],
        ),
        SizedBox(height: 36),
        Header(
          level: 0,
          title: 'Case Details - Basic',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Basic Surgery Data', textScaleFactor: 1.5),
            ],
          ),
        ),
        ...basicDataItems.entries.map(
          (e) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PaddedText(e.key.titleCase),
              ),
              Expanded(
                child: PaddedText(e.value?.toString().sentenceCase ?? ''),
                flex: 2,
              )
            ],
          ),
        ),
        SizedBox(height: 36),
        Header(
          level: 0,
          title: 'Case Details - Template',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Surgery Specific Data', textScaleFactor: 1.5),
            ],
          ),
        ),
        ...fieldsData.map(
          (e) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PaddedText(e.title),
              ),
              Expanded(
                child: PaddedText(e.value),
                flex: 2,
              )
            ],
          ),
        ),

        /// timeline data
        SizedBox(height: 36),
        Header(
          level: 0,
          title: 'Case Details - Timeline',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Surgery Followup Data - (${casePdfModel.timelines?.length ?? 0} records)',
                textScaleFactor: 1.5,
              ),
            ],
          ),
        ),
        ...(casePdfModel.timelines ?? []).map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 24,
              ),
              SizedBox(
                child: Text(e.eventDate ?? ''),
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.all(4),
                child: GridView(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                  children: e.mediaFiles.map<Widget>((mediaFile) {
                    if (mediaFile == null) return SizedBox.shrink();
                    try {
                      final memoryImage =
                          MemoryImage(mediaFile.readAsBytesSync());

                      return SizedBox.square(
                        dimension: 90,
                        child: Image(memoryImage, fit: BoxFit.cover),
                      );
                    } catch (err) {
                      return SizedBox.square(
                        dimension: 90,
                        child: Center(child: Text('Missing')),
                      );
                    }
                  }).toList(),
                ),
              ),
              ...e.notes.map(
                (note) => Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(note ?? ''),
                ),
              )
            ],
          );
        })
      ],
    ),
  );

  return doc.save();
}
