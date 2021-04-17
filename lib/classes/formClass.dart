import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/classes/profileclass.dart';

class FormClass{
  int tripid;
  Future<List<Map<String, dynamic>>> travelExpenses;
  Future<List<Map<String, dynamic>>> otherExpenses;
  Future<tripclass> tripInfo;
  Future<Profile> profile;
  FormClass(this.tripid){
    otherExpenses = getElementsOtherExpense(this.tripid);
    travelExpenses = getElements(this.tripid);
    profile = getProfileById('1');
    tripInfo = getTripById(this.tripid);
  }
}