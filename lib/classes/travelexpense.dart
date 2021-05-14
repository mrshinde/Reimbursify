import '../database.dart';

class Travel {
  final int tripid;
  final int serial_number;
  final String dep_time;
  final String dep_date;
  final String dep_station;
  final String arr_time;
  final String arr_date;
  final String arr_station;
  final String mot;
  final double km;
  final double fare;
  final String currency;
  final String pnr;
  final String remarks;
  final String ticket_address;
  final String receipt_location;

  Travel(
      {this.tripid,
      this.serial_number,
      this.dep_time,
      this.dep_date,
      this.dep_station,
      this.arr_time,
      this.arr_date,
      this.arr_station,
      this.mot,
      this.km,
      this.fare,
      this.currency,
      this.pnr,
      this.remarks,
      this.ticket_address,
      this.receipt_location});

  Map<String, dynamic> toMap() {
    final map = new Map<String, dynamic>();
    map["tripid"] = tripid;
    // map["serial_number"] = serial_number;
    map["dep_time"] = dep_time;
    map["dep_date"] = dep_date;
    map["dep_station"] = dep_station;
    map["arr_time"] = arr_time;
    map["arr_date"] = arr_date;
    map["arr_station"] = arr_station;
    map["mot"] = mot;
    map["km"] = km;
    map["fare"] = fare;
    map["currency"] = currency;
    map["pnr"] = pnr;
    map["remarks"] = remarks;
    map["ticket_address"] = ticket_address;
    map["receipt_location"] = receipt_location;
    return map;
  }

  fromMap(Map<String, dynamic> data) => new Travel(
        tripid: data['tripid'],
        serial_number: data['serial_number'],
        dep_time: data['dep_time'],
        dep_date: data['dep_date'],
        dep_station: data['dep_station'],
        arr_time: data['arr_time'],
        arr_date: data['arr_date'],
        arr_station: data['arr_station'],
        mot: data['mot'],
        km: data['km'],
        fare: data['fare'],
        currency: data['currency'],
        pnr: data['pnr'],
        remarks: data['remarks'],
        ticket_address: data['ticket_address'],
        receipt_location: data['receipt_location'],
      );
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> insertTravelExpense(
    int tripid,
    String dep_time,
    String dep_date,
    String dep_station,
    String arr_time,
    String arr_date,
    String arr_station,
    String mot,
    dynamic km,
    dynamic fare,
    String currency,
    String pnr,
    String remarks,
    String ticket_address,
    String receipt_location) async {
  final todo = new Travel(
    tripid: tripid,
    dep_time: dep_time,
    dep_date: dep_date,
    dep_station: dep_station,
    arr_time: arr_time,
    arr_date: arr_date,
    arr_station: arr_station,
    mot: mot,
    km: km,
    fare: fare,
    currency: currency,
    pnr: pnr,
    remarks: remarks,
    ticket_address: ticket_address,
    receipt_location: receipt_location,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('travel', todo.toMap());
  print('Inserted');
  print(sn);
  return sn;
}

Future<Travel> getItemById(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from travel where serial_number = ?", [id]);
  if (list.length > 0) {
    return Travel().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getElements(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from travel where tripid = ?", [id]);
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteItem(int id) async {
  return await _databaseHelper.db
      .delete("travel", where: "serial_number = ?", whereArgs: [id]);
}

Future<int> deleteTravelbyTrip(int id) async {
  return await _databaseHelper.db.delete("travel", where: "tripid = ?", whereArgs: [id]);
}

Future<int> updateTravelExpense(
    int id,
    int tripid,
    String dep_time,
    String dep_date,
    String dep_station,
    String arr_time,
    String arr_date,
    String arr_station,
    String mot,
    double km,
    double fare,
    String currency,
    String pnr,
    String remarks,
    String ticket_address,
    String receipt_location) async {
  final todo = new Travel(
    tripid: tripid,
    dep_time: dep_time,
    dep_date: dep_date,
    dep_station: dep_station,
    arr_time: arr_time,
    arr_date: arr_date,
    arr_station: arr_station,
    mot: mot,
    km: km,
    fare: fare,
    currency: currency,
    pnr: pnr,
    remarks: remarks,
    ticket_address: ticket_address,
    receipt_location: receipt_location,
  );
  return await _databaseHelper.db.update('travel', todo.toMap(),
      where: "serial_number = ?", whereArgs: [id]);
}

Future<int> updateaddress(String add, int id) async {
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.rawUpdate(
      '''UPDATE travel SET receipt_location = ? WHERE serial_number = ?''',
      [add, id]);

  return sn;
}

Future<List<Map>> GetTotal(
  int id,
) async {
  List<Map> list = await _databaseHelper.db.rawQuery(
      "SELECT sum(fare) as am, currency FROM travel WHERE tripid = ? GROUP BY currency",
      [id]);
  print(list);
  if (list.length > 0) {
    return list;
  }
  return null;
}
