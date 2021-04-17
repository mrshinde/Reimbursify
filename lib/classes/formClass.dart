import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/classes/profileclass.dart';

class FormClass{
  int tripid;
  List<Map<String, dynamic>> travelExpenses;
  List<Map<String, dynamic>> otherExpenses;
  Map<String, dynamic> tripInfo;
  Map<String, dynamic> profile;
  FormClass(this.tripid){
    getElementsOtherExpense(this.tripid).then((value){this.otherExpenses = value;});
    getElements(this.tripid).then((value){this.travelExpenses = value;});
    getProfileById('1').then((value){this.profile = value.toMap();});
    getTripById(this.tripid).then((value){this.tripInfo = value.tomap();});
  }
}