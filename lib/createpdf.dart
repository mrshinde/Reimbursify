import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/travelexpense.dart';

Future<void> createPDF(int id) async {
  //Creates a new PDF document
  PdfDocument document = PdfDocument();
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
    row2.cells[8].value = travel_expenses[i]['fare'].toString();
    row2.cells[9].value = travel_expenses[i]['pnr'];
    row2.cells[10].value = travel_expenses[i]['remarks'];
  }
//Gets the width of the PDF grid cell
//   double width = row2.cells[2].width;
// //Gets the height of the PDF grid cell
//   double height = row2.cells[2].height;
//Draw the grid in PDF document page
  grid.draw(page: document.pages.add());
  List<int> bytes = document.save();
// , bounds: const Rect.fromLTWH(0, 0, 0, 0)
//Dispose the document
  document.dispose();

  final directory = await getExternalStorageDirectory();

//Get directory path
  final path = directory.path;

//Create an empty file to write PDF data
  File file = File('$path/Output.pdf');

//Write PDF data
  await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
  OpenFile.open('$path/Output.pdf');
}
