import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/reimbursements.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:tripmanager/classes/tripclass.dart';

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

Future<void> createotherPDF(int id) async {
  //Creates a new PDF document
  PdfDocument document = PdfDocument();
  // document.pageSettings.margins.all = 50.0;
  document.compressionLevel = PdfCompressionLevel.best;
  PdfPage page = document.pages.add();
  final dy = await getApplicationDocumentsDirectory();
  final p = dy.path;
//Draw the image
  page.graphics.drawString(
      'Travel Expenses', PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(0, 0, 500, 40));
  // String temp = ";k=k HkÙkk çxriwxfr xcy rS;kj djus ds xy, vuqns'k";
  // page.graphics.drawString(temp, PdfTrueTypeFont(font.readAsBytesSync(), 15),
  //     bounds: Rect.fromLTWH(50, 250, 500, 40));
//Create a PdfGrid
  PdfGrid grid = PdfGrid();
//Add columns to grid
  grid.columns.add(count: 11);
  // PdfGridRow header = grid.headers.add(1)[0];
  PdfGridRow header = grid.rows.add();
  header.cells[0].value = 'Departure';
  header.cells[3].value = 'Arrival';
  header.cells[6].value = 'Mode of Travel';
  header.cells[7].value = 'KM';
  header.cells[8].value = 'Fare';
  header.cells[9].value = 'PNR No';
  header.cells[10].value = 'Remarks';

  header.cells[0].columnSpan = 3;
  header.cells[3].columnSpan = 3;

  header.cells[6].rowSpan = 2;
  header.cells[7].rowSpan = 2;
  header.cells[8].rowSpan = 2;
  header.cells[9].rowSpan = 2;
  header.cells[10].rowSpan = 2;

//Add the styles to specific cell
  // header.cells[0].style.stringFormat = PdfStringFormat(
  //     alignment: PdfTextAlignment.center,
  //     lineAlignment: PdfVerticalAlignment.bottom,
  //     wordSpacing: 10);
  // header.cells[1].style.textPen = PdfPens.mediumVioletRed;
  // header.cells[2].style.backgroundBrush = PdfBrushes.yellow;
  // header.cells[2].style.textBrush = PdfBrushes.darkOrange;
//Add rows to grid
  PdfGridRow row1 = grid.rows.add();
  row1.cells[0].value = 'Date';
  row1.cells[1].value = 'Time';
  row1.cells[2].value = 'Place';
  row1.cells[3].value = 'Date';
  row1.cells[4].value = 'Time';
  row1.cells[5].value = 'Place';
//Sets the rowSpan
  // row1.cells[1].rowSpan = 2;
//Sets the colSpan
  // row1.cells[1].columnSpan = 2;
//Apply the cell style to specific row cells
  // row1.cells[0].style = PdfGridCellStyle(
  //   backgroundBrush: PdfBrushes.lightYellow,
  //   cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 5),
  //   font: PdfStandardFont(PdfFontFamily.timesRoman, 17),
  //   textBrush: PdfBrushes.white,
  //   textPen: PdfPens.orange,
  // );
  List<Map<dynamic, dynamic>> travel_expenses = await getElements(id);
  for (var i = 0; travel_expenses != null && i < travel_expenses.length; i++) {
    PdfGridRow row2 = grid.rows.add();
    row2.cells[0].value = travel_expenses[i]['dep_date'];
    row2.cells[1].value = travel_expenses[i]['dep_time'];
    row2.cells[2].value = travel_expenses[i]['dep_station'];
    row2.cells[3].value = travel_expenses[i]['arr_date'];
    row2.cells[4].value = travel_expenses[i]['arr_time'];
    row2.cells[5].value = travel_expenses[i]['arr_station'];
    row2.cells[6].value = travel_expenses[i]['mot'];
    row2.cells[7].value = travel_expenses[i]['km'].toString();
    row2.cells[8].value = travel_expenses[i]['currency'] +
        ' ' +
        travel_expenses[i]['fare'].toString();
    row2.cells[9].value = travel_expenses[i]['pnr'];
    row2.cells[10].value = travel_expenses[i]['remarks'];
  }
//Gets the width of the PDF grid cell
//   double width = row2.cells[2].width;
// //Gets the height of the PDF grid cell
//   double height = row2.cells[2].height;
//Draw the grid in PDF document page
  int count1 = document.pages.count;
  PdfLayoutResult result = grid.draw(
      page: page, bounds: const Rect.fromLTWH(0, 40, 0, 0)) as PdfLayoutResult;
  int count2 = document.pages.count;
  double bound = result.bounds.bottom;
  PdfPage pp = result.page;
  // if (count2 != count1) {}
  PdfGrid grid2 = PdfGrid();
  grid2.columns.add(count: 4);
  grid2.headers.add(1);
  PdfGridRow header2 = grid2.headers[0];
  header2.cells[0].value = 'S. No.';
  header2.cells[1].value = 'Details';
  header2.cells[2].value = 'Amount Paid';
  header2.cells[3].value = 'Reciept Details';

  List<Map<dynamic, dynamic>> other_expenses =
      await getElementsOtherExpense(id);

  for (var i = 0; other_expenses != null && i < other_expenses.length; i++) {
    PdfGridRow row2 = grid2.rows.add();
    row2.cells[0].value = (i + 1).toString();
    row2.cells[1].value = other_expenses[i]['details'];
    row2.cells[2].value = other_expenses[i]['currency'] +
        ' ' +
        other_expenses[i]['amount_paid'].toString();
    row2.cells[3].value = other_expenses[i]['receipt_details'];
  }
  PdfPage page2 = result.page;
  double bound2 = result.bounds.bottom;
  page2.graphics.drawString(
      'Other Expenses', PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(0, bound2 + 20, 500, 40));
  result = grid2.draw(page: page2, bounds: Rect.fromLTWH(0, bound2 + 60, 0, 0));

  // print(page3.getClientSize());
  // print(bound3);

  // PdfPage pdfPage = document.pages[document.pages.count - 1];
  // page.graphics.drawImage(PdfBitmap(foot3.readAsBytesSync()),Rect.fromLTWH(0,0,page.getClientSize().width,page.getClientSize().height));

  List<int> bytes = document.save();
// , bounds: const Rect.fromLTWH(0, 0, 0, 0)
//Dispose the document
  document.dispose();

  final directory = await getExternalStorageDirectory();

//Get directory path
  final path = directory.path;
  tripclass tt = await getTripById(id);

  DateTime dd = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dd) + tt.title;
//Create an empty file to write PDF data
  File file = File('$path/' + formattedDate + '.pdf');

//Write PDF data
  await file.writeAsBytes(bytes, flush: true);
  print("hihello1");
  await addreimbursement(
      id,
      tt.title,
      'other-pdf',
      '$path/' + formattedDate + '.pdf',
      DateFormat('yyyy-MM-dd – kk:mm').format(dd));
//Open the PDF document in mobile
  OpenFile.open('$path/' + formattedDate + '.pdf');
//Create an empty file to write PDF data
//   File file = File('$path/Output.pdf');

// //Write PDF data
//   await file.writeAsBytes(bytes, flush: true);

// //Open the PDF document in mobile
//   OpenFile.open('$path/Output.pdf');
}
