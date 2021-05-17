import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/reimbursements.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:tripmanager/classes/tripclass.dart';

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

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return file;
}

Future<bool> createPDF(int id) async {
  //Creates a new PDF document
  PdfDocument document = PdfDocument();
  // document.pageSettings.margins.all = 50.0;
  document.compressionLevel = PdfCompressionLevel.best;
  PdfPage page = document.pages.add();
  final dy = await getApplicationDocumentsDirectory();
  final p = dy.path;
//Draw the image
  File f = await getImageFileFromAssets('iit.png');
  page.graphics.drawImage(
      //
      PdfBitmap(f.readAsBytesSync()),
      Rect.fromLTWH(0, 0, 70, 70));
  File formpic = await getImageFileFromAssets('formpic.png');
  Profile user_profile = await getProfileById('1');
// PdfPage pagedocument.pages[0];
  String name = user_profile.name;
  String Emp_code = user_profile.id;
  String dep = user_profile.dep;
  String designation = user_profile.designation;
  String gradepay = user_profile.grade_pay;

  tripclass tt = await getTripById(id);

  String budget_head = tt.budget_head;
  String adv = tt.advance.toString();
  String date = tt.start_date;
  String account = user_profile.acc_number;
  File font = await getImageFileFromAssets('KRDEV010.TTF');
//Draw the text
  String iit = "Hkkjrh; çkS|ksxxdh laLFkku jksiM+";
  String h3 = ";k=k HkÙkk çxriwxfr @ xuiVkjk çi=";
  page.graphics.drawString(iit, PdfTrueTypeFont(font.readAsBytesSync(), 20),
      bounds: Rect.fromLTWH(170, 20, 500, 40));
  page.graphics.drawString('INDIAN INSTITUTE OF TECHNOLOGY ROPAR',
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(80, 40, 500, 40));
  page.graphics.drawString(h3, PdfTrueTypeFont(font.readAsBytesSync(), 18),
      bounds: Rect.fromLTWH(160, 60, 500, 40));
  page.graphics.drawString('TRAVELLING ALLOWANCE REIMBURSEMENT/SETTLEMENT FORM',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: Rect.fromLTWH(80, 80, 500, 40));
  page.graphics.drawString(
      'uke @    ', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 120, 500, 40));
  page.graphics.drawString(
      'Name: ' + name, PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(50, 120, 500, 40));
  page.graphics.drawString(
      'O;fxd la-@', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(300, 120, 500, 40));
  page.graphics.drawString(
      'Emp. Code: ' + Emp_code, PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(340, 120, 500, 40));
  page.graphics.drawString(
      'foHkkx@dsaæ@ ', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 140, 500, 40));
  page.graphics.drawString(
      'Deptt./Center: ' + dep, PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(70, 140, 500, 40));
  page.graphics.drawString('inuke', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(300, 140, 500, 40));
  page.graphics.drawString('/Designation: ' + designation,
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(325, 140, 500, 40));
  page.graphics.drawString(
      'xzsM osru lfxr ewy osru', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 160, 500, 40));
  page.graphics.drawString('/Basic Pay with Grade Pay: ' + gradepay,
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(115, 160, 500, 40));
  String bh = """ctV 'kh"kZ@""";
  page.graphics.drawString(bh, PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(350, 160, 500, 40));
  page.graphics.drawString('Budget Head: ' + budget_head,
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(390, 160, 500, 40));
  page.graphics.drawString('vuqeksxnr ;k=k dkf;Øe dh çxrxyxi layXu gS @',
      PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 180, 500, 40));
  page.graphics.drawString('Copy of the approved Tour programme attached. ',
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(200, 180, 500, 40));
  page.graphics.drawString(
      "vkgfjr vfxze jkf'k #-", PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 200, 500, 40));
  page.graphics.drawString(
      '/Advance drawn Rs: ' + adv, PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(100, 200, 500, 40));
  // String bh = """ctV 'kh"kZ@""";
  page.graphics.drawString(
      'fnukad', PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(330, 200, 500, 40));
  page.graphics.drawString(
      '/Date: ' + date, PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(355, 200, 500, 40));
  page.graphics.drawString(
      "cSad [kkrk la-@", PdfTrueTypeFont(font.readAsBytesSync(), 10),
      bounds: Rect.fromLTWH(25, 220, 500, 40));
  page.graphics.drawString('Bank Account No. (SBI/Any other): ' + account,
      PdfStandardFont(PdfFontFamily.helvetica, 10),
      bounds: Rect.fromLTWH(75, 220, 500, 40));

  page.graphics.drawImage(
      PdfBitmap(formpic.readAsBytesSync()), Rect.fromLTWH(15, 240, 500, 250));
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
    row2.cells[10].value =
        parseComment(travel_expenses[i]['remarks'])['additional_comments'];
  }
//Gets the width of the PDF grid cell
//   double width = row2.cells[2].width;
// //Gets the height of the PDF grid cell
//   double height = row2.cells[2].height;
//Draw the grid in PDF document page
  int count1 = document.pages.count;
  PdfLayoutResult result = grid.draw(
      page: page, bounds: const Rect.fromLTWH(0, 500, 0, 0)) as PdfLayoutResult;
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
    row2.cells[3].value = parseComment(
        other_expenses[i]['receipt_details'])['additional_comments'];
  }
  PdfPage page2 = result.page;
  double bound2 = result.bounds.bottom;

  if (page2.getClientSize().height - bound2 < 95) {
    bound2 = 0;
    page2 = document.pages.add();
  }

  File foot1 = await getImageFileFromAssets('foot1.PNG');
  File foot2 = await getImageFileFromAssets('foot2.PNG');
  File foot3 = await getImageFileFromAssets('foot3.PNG');
  page2.graphics.drawImage(PdfBitmap(foot1.readAsBytesSync()),
      Rect.fromLTWH(0, bound2 + 20, 500, 40));
  page2.graphics.drawImage(PdfBitmap(foot2.readAsBytesSync()),
      Rect.fromLTWH(0, bound2 + 40, 500, 35));

  result = grid2.draw(page: page2, bounds: Rect.fromLTWH(0, bound2 + 80, 0, 0));
  double bound3 = result.bounds.bottom;
  PdfPage page3 = result.page;
  // print(page3.getClientSize());
  // print(bound3);
  if (page3.getClientSize().height - bound3 < 270) {
    bound3 = 0;
    page3 = document.pages.add();
  }
  // PdfPage pdfPage = document.pages[document.pages.count - 1];
  // page.graphics.drawImage(PdfBitmap(foot3.readAsBytesSync()),Rect.fromLTWH(0,0,page.getClientSize().width,page.getClientSize().height));
  page3.graphics.drawImage(PdfBitmap(foot3.readAsBytesSync()),
      Rect.fromLTWH(0, bound3 + 20, 500, 250));

  List<int> bytes = document.save();
// , bounds: const Rect.fromLTWH(0, 0, 0, 0)
//Dispose the document
  document.dispose();
  print("hihello");

  final directory = await getExternalStorageDirectory();

//Get directory path
  final path = directory.path;

  DateTime dd = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dd) +
      tt.title +
      UniqueKey().toString();
//Create an empty file to write PDF data
  File file = File('$path/' + formattedDate + '.pdf');

//Write PDF data
  await file.writeAsBytes(bytes, flush: true);
  print("hihello1");
  await addreimbursement(
      id,
      tt.title,
      'iitrpr-pdf',
      '$path/' + formattedDate + '.pdf',
      DateFormat('yyyy-MM-dd – kk:mm').format(dd));
//Open the PDF document in mobile
  OpenFile.open('$path/' + formattedDate + '.pdf');
  print("hihello2");
  return Future.value(true);
}
