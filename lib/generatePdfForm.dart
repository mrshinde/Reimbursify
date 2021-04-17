import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/formClass.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context){
        return <pw.Widget>[
          createHeader(),
        ];
      },
    )
  );
}

pw.Widget createHeader(){
  return pw.Table(
    // TODO: create a table form widget with IIT Logo and Name
  );
}