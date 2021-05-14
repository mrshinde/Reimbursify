import '../database.dart';

class OtherExpense {
  final int tripid;
  final int serial_number;
  final String type;
  final String details;
  final double amount_paid;
  final String currency;
  final String receipt_details;
  final String receipt_address;
  final String receipt_location;
  final String date;

  OtherExpense(
      {this.tripid,
      this.serial_number,
      this.type,
      this.details,
      this.amount_paid,
      this.currency,
      this.receipt_details,
      this.receipt_address,
      this.receipt_location,
      this.date});

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["tripid"] = tripid;
    // map["serial_number"] = serial_number;
    map["type"] = type;
    map["details"] = details;
    map["amount_paid"] = amount_paid;
    map["currency"] = currency;
    map["receipt_details"] = receipt_details;
    map["receipt_address"] = receipt_address;
    map["receipt_location"] = receipt_location;
    map["date"] = date;
    return map;
  }

  fromMap(Map<String, dynamic> data) => new OtherExpense(
        tripid: data['tripid'],
        serial_number: data['serial_number'],
        type: data["type"],
        details: data["details"],
        amount_paid: data["amount_paid"],
        currency: data["currency"],
        receipt_details: data["receipt_details"],
        receipt_address: data["receipt_address"],
        receipt_location: data["receipt_location"],
        date: data["date"],
      );
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> insertOtherExpense(
    int tripid,
    String type,
    String details,
    double amount_paid,
    String currency,
    String receipt_details,
    String receipt_address,
    String receipt_location,
    String date) async {
  final todo = new OtherExpense(
    tripid: tripid,
    type: type,
    details: details,
    amount_paid: amount_paid,
    currency: currency,
    receipt_details: receipt_details,
    receipt_address: receipt_address,
    receipt_location: receipt_location,
    date: date,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('otherexpense', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<OtherExpense> getItemByIdOtherExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from otherexpense where serial_number = ?", [id]);
  if (list.length > 0) {
    return OtherExpense().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getElementsOtherExpense(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from otherexpense where tripid = ?", [id]);
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteItemOtherExpense(int id) async {
  return await _databaseHelper.db.delete("otherexpense", where: "serial_number = ?", whereArgs: [id]);
}

Future<int> deleteItemOtherExpensebyTrip(int id) async {
  return await _databaseHelper.db.delete("otherexpense", where: "tripid = ?", whereArgs: [id]);
}

Future<int> updateOtherExpense(
  int id,
  int tripid,
  String type,
  String details,
  double amount_paid,
  String currency,
  String receipt_details,
  String receipt_address,
  String receipt_location,
  String date,
) async {
  final todo = new OtherExpense(
      tripid: tripid,
      type: type,
      details: details,
      amount_paid: amount_paid,
      currency: currency,
      receipt_details: receipt_details,
      receipt_address: receipt_address,
      receipt_location: receipt_location,
      date: date);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.update('OtherExpense', todo.toMap(),
      where: "serial_number = ?", whereArgs: [id]);
  print('Inserted');
  print(sn);
  return sn;
}

Future<int> updateaddress(String add, int id) async {
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.rawUpdate(
      '''UPDATE OtherExpense SET receipt_location = ? WHERE serial_number = ?''',
      [add, id]);

  return sn;
}

Future<List<Map>> GetOtherTotal(
  int id,
) async {
  List<Map> list = await _databaseHelper.db.rawQuery(
      "SELECT sum(amount_paid) as am, currency FROM OtherExpense WHERE tripid = ? GROUP BY currency",
      [id]);
  print(list);
  if (list.length > 0) {
    return list;
  }
  return null;
}
