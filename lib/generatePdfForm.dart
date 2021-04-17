import 'package:flutter/services.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/formClass.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<int> createPdf(int tripid) async{
  FormClass form = FormClass(tripid);
  List<Map<String, dynamic>> travelExpenses = await form.travelExpenses;
  List<Map<String, dynamic>> otherExpenses = await form.otherExpenses;
  Profile profile = await form.profile;
  tripclass tripInfo = await form.tripInfo;

  final pdf = pw.Document(
    author: profile.name,
    title: tripInfo.title + tripInfo.start_date,
  );

  final iit_logo = (await rootBundle.load('assets/iit.png')).buffer.asUint8List();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context){
        return <pw.Widget>[
          createHeader(iit_logo),
        ];
      },
    )
  );
  Directory directoryPath = await getApplicationDocumentsDirectory();
  String docPath = directoryPath.path;
  print(docPath);
  var targetName = tripInfo.title + tripInfo.start_date;
  File filename = File('$docPath/$targetName.pdf');
  pdf.save().then((value){filename.writeAsBytesSync(value);});
}

pw.Widget createHeader(var imgData){
  return pw.Table(
    columnWidths: {0: pw.FractionColumnWidth(0.2), 1: pw.FractionColumnWidth(0.8)},
    children: <pw.TableRow>[
      pw.TableRow(
        children: <pw.Widget>[
          pw.Image(pw.MemoryImage(imgData)),
          pw.Text('Indian Institute of Technology Ropar'),
        ],
      ),
    ],
  );
}