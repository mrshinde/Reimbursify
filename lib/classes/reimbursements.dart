import '../database.dart';

class Reimbursements {
  final String serial_number;
  final int tripid;
  final String title;
  final String type;
  final String file_name;
  final String date;

  Reimbursements({
    this.serial_number,
    this.tripid,
    this.title,
    this.type,
    this.file_name,
    this.date,
  });

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["tripid"] = tripid;
    // map["serial_number"] = serial_number;
    map["type"] = type;
    map["title"] = title;
    map["file_name"] = file_name;
    // map["receipt_details"] = receipt_details;
    // map["receipt_address"] = receipt_address;
    map["date"] = date;
    return map;
  }

  fromMap(Map<String, dynamic> data) => new Reimbursements(
      tripid: data['tripid'],
      serial_number: data['serial_number'],
      type: data['type'],
      title: data['title'],
      file_name: data['file_name'],
      date: data["date"]);
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> addreimbursement(int tripid, String title, String type,
    String file_name, String date) async {
  final todo = new Reimbursements(
    tripid: tripid,
    type: type,
    title: title,
    date: date,
    file_name: file_name,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('reimbursements', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<Reimbursements> getItemByIdReimbursements() async {
  //databaseHelper has been injected in the class
  List<Map> list =
      await _databaseHelper.db.rawQuery("Select * from reimbursements");
  if (list.length > 0) {
    return Reimbursements().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getElementsReimbursements() async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db.rawQuery(
    "Select * from reimbursements",
  );
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteItemReimbursements(int id) async {
  return await _databaseHelper.db
      .delete("reimbursements", where: "serial_number = ?", whereArgs: [id]);
}
