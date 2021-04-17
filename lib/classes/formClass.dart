import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/classes/profileclass.dart';

class FormClass{
  int tripid;
  List<Map<String, dynamic>> travelExpenses;
  List<Map<String, dynamic>> otherExpenses;
  Map<String, dynamic> profile;
  FormClass(this.tripid){
    getElementsOtherExpense(this.tripid).then((value){otherExpenses = value;});
    getElements(this.tripid).then((value){travelExpenses = value;});
    getProfileById('1').then((value){profile = value.toMap();});
  }
}