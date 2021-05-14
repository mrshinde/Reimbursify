import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Alignment;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/reimbursements.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:tripmanager/classes/tripclass.dart';

//Local imports

Map<String, String> parseComment(String comment) {
  final regex = RegExp(
      r'^Payment made through card which has type: (.+), account number: (.*), card number: (.*);(.*)$');
  final match = regex.firstMatch(comment);
  if (match == null)
    return null;
  else {
    return {
      'type': match.group(1),
      'acc_no': match.group(2),
      'number': match.group(3),
      'additional_comments': match.group(4)
    };
  }
}

Future<bool> generateExcel(int tripid) async {
  //Creating a workbook.
  final Workbook workbook = Workbook();
  //Accessing via index
  final Worksheet sheet = workbook.worksheets[0];
  sheet.showGridlines = true;

  // Enable calculation for worksheet.
  sheet.enableSheetCalculations();
  final Range range0 = sheet.getRangeByName('A1:K1');
  range0.merge();
  range0.setText('Travel Expeses');
  range0.cellStyle.fontSize = 30;
  range0.cellStyle.bold = true;
  range0.cellStyle.hAlign = HAlignType.center;
  range0.cellStyle.vAlign = VAlignType.center;

  final Range range01 = sheet.getRangeByName('N1:Q1');
  range01.merge();
  range01.setText('Other Expenses');
  range01.cellStyle.fontSize = 30;
  range01.cellStyle.bold = true;
  range01.cellStyle.hAlign = HAlignType.center;
  range01.cellStyle.vAlign = VAlignType.center;

  // sheet.getRangeByName('A1').columnWidth = 4.82;
  // sheet.getRangeByName('B1:C1').columnWidth = 13.82;
  // sheet.getRangeByName('D1').columnWidth = 13.20;
  // sheet.getRangeByName('E1').columnWidth = 7.50;
  sheet.getRangeByName('A1').rowHeight = 79.73;
  // sheet.getRangeByName('K1').columnWidth = 188.82;
  sheet.getRangeByName('J1').columnWidth = 24.46;
  sheet.getRangeByName('Q1').columnWidth = 34.46;
  final Range range1 = sheet.getRangeByName('A3:C3');
  final Range range2 = sheet.getRangeByName('D3:F3');
  range2.merge();
  range2.autoFitColumns();
  range1.merge();
  range1.autoFitColumns();
  sheet.getRangeByName('A3').setValue('Departure');
  range1.cellStyle.fontSize = 16;
  range1.cellStyle.bold = true;
  range1.cellStyle.hAlign = HAlignType.center;
  sheet.getRangeByName('D3').setValue('Arrival');
  range2.cellStyle.fontSize = 16;
  range2.cellStyle.bold = true;
  range2.cellStyle.hAlign = HAlignType.center;
  final Range range3 = sheet.getRangeByName('G3:G4');
  range3.merge();
  // range3.autoFitColumns();
  sheet.getRangeByName('G3').setValue('Mode of Travel');
  range3.cellStyle.fontSize = 16;
  range3.cellStyle.bold = true;
  range3.cellStyle.vAlign = VAlignType.center;
  range3.autoFitColumns();
  final Range rangett = sheet.getRangeByName('H3:H4');
  rangett.merge();
  rangett.autoFitColumns();
  sheet.getRangeByName('H3').setValue('KM');
  rangett.cellStyle.fontSize = 16;
  rangett.cellStyle.bold = true;
  rangett.cellStyle.vAlign = VAlignType.center;
  final Range range4 = sheet.getRangeByName('I3:I4');
  range4.merge();
  range4.autoFitColumns();
  sheet.getRangeByName('I3').setValue('Fare');
  range4.cellStyle.fontSize = 16;
  range4.cellStyle.bold = true;
  range4.cellStyle.vAlign = VAlignType.center;
  final Range range5 = sheet.getRangeByName('J3:J4');
  range5.merge();
  range5.autoFitColumns();
  sheet.getRangeByName('J3').setValue('Ticekt No/ PNR No');
  range5.cellStyle.fontSize = 16;
  range5.cellStyle.bold = true;
  range5.cellStyle.vAlign = VAlignType.center;
  final Range range6 = sheet.getRangeByName('K3:K4');
  range6.merge();
  range6.autoFitColumns();
  sheet.getRangeByName('K3').setValue('Remarks');
  range6.cellStyle.fontSize = 16;
  range6.cellStyle.bold = true;
  range6.cellStyle.hAlign = HAlignType.center;
  sheet.getRangeByName('A4').setValue('Date');
  sheet.getRangeByName('B4').setValue('Time');
  sheet.getRangeByName('C4').setValue('Place');
  sheet.getRangeByName('D4').setValue('Date');
  sheet.getRangeByName('E4').setValue('Time');
  sheet.getRangeByName('F4').setValue('Place');
  // sheet.insertColumn(1, 12, ExcelInsertOptions.formatAsBefore);
  // sheet.insertRow(1, 1, ExcelInsertOptions.formatAsAfter);
  List<Map<dynamic, dynamic>> travel_expenses = await getElements(tripid);
  for (var i = 0; travel_expenses != null && i < travel_expenses.length; i++) {
    final List<Object> list = [
      travel_expenses[i]['dep_date'],
      travel_expenses[i]['dep_time'],
      travel_expenses[i]['dep_station'],
      travel_expenses[i]['arr_date'],
      travel_expenses[i]['arr_time'],
      travel_expenses[i]['arr_station'],
      travel_expenses[i]['mot'],
      travel_expenses[i]['km'],
      travel_expenses[i]['currency'] +
          ' ' +
          travel_expenses[i]['fare'].toString(),
      travel_expenses[i]['pnr'],
      parseComment(travel_expenses[i]['remarks'])['additional_comments'],
    ];
    sheet.importList(list, 5 + i, 1, false);
    sheet.getRangeByName('K' + (i + 5).toString()).autoFitColumns();
  }
  final Range rangea = sheet.getRangeByName('N3');
  // rangea.merge();
  rangea.autoFitColumns();
  rangea.setValue('S.N.');
  rangea.cellStyle.fontSize = 16;
  rangea.cellStyle.bold = true;
  rangea.cellStyle.hAlign = HAlignType.center;
  final Range rangeb = sheet.getRangeByName('O3');
  // rangeb.merge();
  rangeb.autoFitColumns();
  rangeb.setValue('Details');
  rangeb.cellStyle.fontSize = 16;
  rangeb.cellStyle.bold = true;
  rangeb.cellStyle.hAlign = HAlignType.center;
  final Range rangec = sheet.getRangeByName('P3');
  // rangec.merge();
  rangec.autoFitColumns();
  rangec.setValue('Amount Paid');
  rangec.cellStyle.fontSize = 16;
  rangec.cellStyle.bold = true;
  rangec.cellStyle.hAlign = HAlignType.center;
  final Range ranged = sheet.getRangeByName('Q3');
  // ranged.merge();

  ranged.setValue('Receipt Details');
  ranged.cellStyle.fontSize = 16;
  ranged.cellStyle.bold = true;
  ranged.cellStyle.hAlign = HAlignType.center;
  sheet.autoFitColumn(16);
  sheet.autoFitColumn(15);
  sheet.autoFitColumn(14);
  sheet.autoFitColumn(17);
  sheet.autoFitColumn(10);

  sheet.autoFitColumn(11);
  List<Map<dynamic, dynamic>> other_expenses =
      await getElementsOtherExpense(tripid);

  for (var i = 0; other_expenses != null && i < other_expenses.length; i++) {
    final List<Object> list = [
      i + 1,
      other_expenses[i]['details'],
      other_expenses[i]['currency'] +
          ' ' +
          other_expenses[i]['amount_paid'].toString(),
      parseComment(other_expenses[i]['receipt_details'])['additional_comments']
    ];
    sheet.importList(list, 5 + i, 14, false);
    sheet.getRangeByName('Q' + (i + 5).toString()).autoFitColumns();
  }

  sheet.autoFitColumn(17);

  // final Range range2 = sheet.getRangeByName('D3:F3');
  // final Range range2 = sheet.getRangeByName('D3:F3');
  // final Range range2 = sheet.getRangeByName('D3:F3');

  //Save and launch the excel.
  final List<int> bytes = workbook.saveAsStream();
  //Dispose the document.
  workbook.dispose();

// Get external storage directory
  final directory = await getExternalStorageDirectory();

// Get directory path
  final path = directory.path;

  tripclass tt = await getTripById(tripid);

  DateTime dd = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dd) + tt.title;
//Create an empty file to write PDF data
  File file = File('$path/' + formattedDate + '.xlsx');

//Write PDF data
  await file.writeAsBytes(bytes, flush: true);
  print("hihello1");
  await addreimbursement(
      tripid,
      tt.title,
      'xlsx',
      '$path/' + formattedDate + '.xlsx',
      DateFormat('yyyy-MM-dd – kk:mm').format(dd));
//Open the PDF document in mobile
  OpenFile.open('$path/' + formattedDate + '.xlsx');
// Create an empty file to write Excel data
//   File file = File('$path/Output.xlsx');

// // Write Excel data
//   await file.writeAsBytes(bytes, flush: true);

// // Open the Excel document in mobile
//   OpenFile.open('$path/Output.xlsx');
  return true;
}
