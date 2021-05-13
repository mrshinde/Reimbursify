import '../database.dart';

class PersonalExpense {
  final int tripid;
  final int serial_number;
  final String type;
  final String details;
  final double amount_paid;
  final String currency;
  final String date;

  PersonalExpense({
    this.tripid,
    this.serial_number,
    this.type,
    this.details,
    this.amount_paid,
    this.currency,
    this.date,
  });

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["tripid"] = tripid;
    // map["serial_number"] = serial_number;
    map["type"] = type;
    map["details"] = details;
    map["amount_paid"] = amount_paid;
    map["currency"] = currency;
    // map["receipt_details"] = receipt_details;
    // map["receipt_address"] = receipt_address;
    map["date"] = date;
    return map;
  }

  fromMap(Map<String, dynamic> data) => new PersonalExpense(
      tripid: data['tripid'],
      serial_number: data['serial_number'],
      type: data["type"],
      details: data["details"],
      amount_paid: data["amount_paid"],
      currency: data["currency"],
      // receipt_details: data["receipt_details"],
      // receipt_address: data["receipt_address"],
      date: data["date"]);
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> insertPersonalExpense(int tripid, String type, String details,
    double amount_paid, String currency, String date) async {
  final todo = new PersonalExpense(
    tripid: tripid,
    type: type,
    details: details,
    amount_paid: amount_paid,
    currency: currency,
    date: date,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('personalexpense', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<PersonalExpense> getItemByIdPersonalExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from personalexpense where serial_number = ?", [id]);
  if (list.length > 0) {
    return PersonalExpense().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getElementsPersonalExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from personalexpense where tripid = ?", [id]);
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteItemPersonalExpense(int id) async {
  return await _databaseHelper.db
      .delete("personalexpense", where: "serial_number = ?", whereArgs: [id]);
}


Future<int> deleteItemPersonalExpensebyTrip(int id) async {
  return await _databaseHelper.db
      .delete("personalexpense", where: "serial_number = ?", whereArgs: [id]);
}


Future<int> updatePersonalExpense(
    int id,
    int tripid,
    String type,
    String details,
    double amount_paid,
    String currency,
    // String receipt_details,
    // String receipt_address,
    String date) async {
  final todo = new PersonalExpense(
    tripid: tripid,
    type: type,
    details: details,
    amount_paid: amount_paid,
    currency: currency,
    date: date,
    // receipt_details: receipt_details,
    // receipt_address: receipt_address,
    // receipt_location: receipt_location
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.update('personalexpense', todo.toMap(),
      where: "serial_number = ?", whereArgs: [id]);
  print('Inserted');
  print(sn);
  return sn;
}
