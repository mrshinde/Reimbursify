//import 'dart:html';

import 'package:tripmanager/database.dart';
import 'package:tripmanager/classes/profileclass.dart';
class Profile {
  final String uid; //set to 1
  final String name;
  final String id; //employee code
  final String dep; //department
  final String designation;
  final String grade_pay;
  final String acc_number;
  final String ifsc_code;
  final String google; //google account

  Profile({
    this.uid,
    this.name,
    this.id,
    this.dep,
    this.designation,
    this.grade_pay,
    this.acc_number,
    this.ifsc_code,
    this.google,
  });
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["uid"] = uid;
    map["name"] = name;
    // map["serial_number"] = serial_number;
    map["id"] = id;
    map["dep"] = dep;
    map["designation"] = designation;
    map["grade_pay"] = grade_pay;
    map["acc_number"] = acc_number;
    map["ifsc_code"] = ifsc_code;
    map["google"] = google;

    return map;
  }

  fromMap(Map<String, dynamic> data) => new Profile(
    uid: data['uid'],
    name: data['name'],
    id: data['id'],
    dep: data['dep'],
    designation: data['designation'],
    grade_pay: data['grade_pay'],
    acc_number: data['acc_number'],
    ifsc_code: data['ifsc_code'],
    google: data['google'],
  );
}

class PaymentCard {
  final String type;
  final String number; //card number
  final String acc_number;

  PaymentCard({this.type, this.number, this.acc_number});
  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["type"] = type;
    map["number"] = number;
    map["acc_number"] = acc_number;

    return map;
  }

  fromMap(Map<String, dynamic> data) => new PaymentCard(
    type: data['type'],
    number: data['number'],
    acc_number: data['acc_number'],
  );
}

class Account {
  final String acc_number;
  final String ifsc_code;
  final String branch_name;
  final String bank_name;
  final String name; //name of account holder

  Account(
      {this.acc_number,
        this.ifsc_code,
        this.branch_name,
        this.bank_name,
        this.name});

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["acc_number"] = acc_number;
    map["ifsc_code"] = ifsc_code;
    map["branch_name"] = branch_name;
    map["bank_name"] = bank_name;
    map["name"] = name;

    return map;
  }

  fromMap(Map<String, dynamic> data) => new Account(
    acc_number: data['acc_number'],
    ifsc_code: data['ifsc_code'],
    branch_name: data['branch_name'],
    bank_name: data['bank_name'],
    name: data['name'],
  );
}

DatabaseHelper _databaseHelper = Injection.injector.get();
// For Profile class
Future<int> insertProfile(
    String uid,
    String name,
    String id,
    String dep,
    String designation,
    String grade_pay,
    String acc_number,
    String ifsc_code,
    String google) async {
  final todo = new Profile(
    uid: uid,
    name: name,
    id: id,
    dep: dep,
    designation: designation,
    grade_pay: grade_pay,
    acc_number: acc_number,
    ifsc_code: ifsc_code,
    google: google,
  );

  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('profile', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<List<Map<String, dynamic>>> getProfiles(String id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db.rawQuery("Select * from profile where uid=?",[id]);
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> updateProfile(
    String name,
    String id,
    String dep,
    String designation,
    String grade_pay,
    String acc_number,
    String ifsc_code,
    String google,
    String uid) async {
  return await _databaseHelper.db.rawUpdate('UPDATE profile SET name = ?, id = ?, dep =?, designation =?, grade_pay =?, acc_number =?, ifsc_code =?, google =? WHERE uid = ?',
      [name, id, dep, designation, grade_pay, acc_number, ifsc_code, google, uid]);
}

Future<int> deleteProfile(String id) async {
  return await _databaseHelper.db
      .delete("profile", where: "uid = ?", whereArgs: [id]);
}

// For Card class
Future<int> insertCard(String type, String number, String acc_number) async {
  final todo = new PaymentCard(
    type: type,
    number: number,
    acc_number: acc_number,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('PaymentCard', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<int> getCardByNumber(String number) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from  paymentCard where number = ?", [number]);
  if (list.length > 0) {
    return PaymentCard().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getCards() async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db.rawQuery("Select * from PaymentCard");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteCard(String number) async {
  return await _databaseHelper.db
      .delete("PaymentCard", where: "number = ?", whereArgs: [number]);
}

// For Account class
Future<int> insertAccount(
    String acc_number,
    String ifsc_code,
    String branch_name,
    String bank_name,
    String name,
    ) async {
  final todo = new Account(
      acc_number: acc_number,
      ifsc_code: ifsc_code,
      branch_name: branch_name,
      bank_name: bank_name,
      name: name);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('account', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<int> getAccountByNumber(String acc_number) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from  Account where acc_number = ?", [acc_number]);
  if (list.length > 0) {
    return Account().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getAccounts(String number) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db.rawQuery("Select * from card");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteAccount(String acc_number) async {
  return await _databaseHelper.db
      .delete("account", where: "acc_number = ?", whereArgs: [acc_number]);
}

Future<Profile> getProfileById(String uid) async {
  //databaseHelper has been injected in the class

  print("test");
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from  profile where uid = ?", [uid]);
  print(list[0]);
  if (list.length > 0) {
    return Profile().fromMap(list[0]);
  }
  return null;
}
