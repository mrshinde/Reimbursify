import '../database.dart';
import 'package:intl/intl.dart';

class tripclass {
  int id;
  String title;
  String start_date;
  String end_date;
  int complete;
  double total;
  int fav;
  String note;
  String budget_head;
  String last_modified;
  double advance;
  int archive;

  tripclass(
      {this.id,
      this.title,
      this.start_date,
      this.end_date,
      this.complete,
      this.note,
      this.total,
      this.budget_head,
      this.last_modified,
      this.advance,
      this.fav,
      this.archive});

  Map<String, dynamic> tomap() {
    return {
      // "id": id,
      "title": title,
      "start_date": start_date,
      "end_date": end_date,
      "complete": complete,
      "total": total,
      "fav": fav,
      "note": note,
      "budget_head": budget_head,
      "last_modified": last_modified,
      "advance": advance,
      "archive": archive
    };
  }

  fromMap(Map<String, dynamic> data) => new tripclass(
      id: data["id"],
      title: data["title"],
      start_date: data["start_date"],
      end_date: data["end_date"],
      complete: data["complete"],
      total: data["total"],
      fav: data["fav"],
      note: data["note"],
      budget_head: data["budget_head"],
      last_modified: data["last_modified"],
      advance: data["advance"],
      archive: data["archive"]);
}

DatabaseHelper _databaseHelper = Injection.injector.get();

Future<int> insertTripExpense(
    String title,
    String start_date,
    String end_date,
    int complete,
    double total,
    int fav,
    String note,
    String budget_head,
    String last_modified,
    double advance,
    int archive) async {
  final todo = new tripclass(
      title: title,
      start_date: start_date,
      end_date: end_date,
      complete: complete,
      total: total,
      fav: fav,
      note: note,
      budget_head: budget_head,
      last_modified: last_modified,
      advance: advance,
      archive: archive);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.insert('trip', todo.tomap());
  return sn;
}

Future<tripclass> getTripById(int id) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from trip where id = ?", [id]);
  if (list.length > 0) {
    return tripclass().fromMap(list[0]);
  }
  return null;
}

Future<List<Map<String, dynamic>>> getTripElements() async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db.rawQuery("Select * from trip");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<List<Map<String, dynamic>>> getTripSorted(String as, String ord) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from trip ORDER BY $as $ord;");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<List<Map<String, dynamic>>> getTripfavarc(String as) async {
  //databaseHelper has been injected in the class
  // .rawQuery("SELECT * FROM trip WHERE title LIKE '%$titl%';");
  int temp = 1;
  List<Map> list = await _databaseHelper.db
      .rawQuery("Select * from trip WHERE $as = $temp;");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<List<Map<String, dynamic>>> getTripbyAll(String titl, int n) async {
  if (n == 1) {
    return getTripbySearch(titl);
  } else if (n == 2) {
    return getTripSorted('title', 'DESC');
  } else if (n == 3) {
    print("Check");
    return getTripSorted('title', 'ASC');
  } else if (n == 4) {
    return getTripSorted('total', 'DESC');
  } else if (n == 5) {
    return getTripSorted('total', 'ASC');
  } else if (n == 6) {
    return getTripSorted('start_date', 'DESC');
  } else if (n == 7) {
    return getTripSorted('start_date', 'ASC');
  } else if (n == 8) {
    return getTripfavarc('fav');
  } else if (n == 9) {
    return getTripfavarc('archive');
  }
}

Future<List<Map<String, dynamic>>> getTripbySearch(String titl) async {
  //databaseHelper has been injected in the class
  List<Map> list = await _databaseHelper.db
      .rawQuery("SELECT * FROM trip WHERE title LIKE '%$titl%';");
  ;
  print("Length of List ");
  print(list.length);
  if (list.length > 0) {
    return list;
  }
  return null;
}

Future<int> deleteTrip(int id) async {
  return await _databaseHelper.db
      .delete("trip", where: "id = ?", whereArgs: [id]);
}

Future<int> archiveTrip(int id, int arch) async {
  return await _databaseHelper.db.rawUpdate('''
    UPDATE trip 
    SET archive = ?
    WHERE id = ?
    ''', [arch, id]);
}

Future<int> favTrip(int id, int fv) async {
  return await _databaseHelper.db.rawUpdate('''
    UPDATE trip 
    SET fav = ?
    WHERE id = ?
    ''', [fv, id]);
}

Future<void> closeTrip(int id) async {
  return await _databaseHelper.db.rawQuery('DROP TABLE trip');
}

Future<int> updateTrip(
    int id,
    String title,
    String start_date,
    String end_date,
    int complete,
    double total,
    int fav,
    String note,
    String budget_head,
    String last_modified,
    double advance,
    int archive) async {
  final todo = new tripclass(
      title: title,
      start_date: start_date,
      end_date: end_date,
      complete: complete,
      total: total,
      fav: fav,
      note: note,
      budget_head: budget_head,
      last_modified: last_modified,
      advance: advance,
      archive: archive);
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db.update('trip', todo.tomap(), where: "id = ?", whereArgs: [id]);
  return sn;
}

Future<int> updateAmount(
  int id,
  double total,
) async {
  final todo = new tripclass(
    total: total,
  );
  //databaseHelper has been injected in the class
  int sn = await _databaseHelper.db
      .rawUpdate('''UPDATE trip SET total = ? WHERE id = ?''', [total, id]);

  return sn;
}

Future<int> updateLastModified(
  int id,
) async {
  //databaseHelper has been injected in the class
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  int sn = await _databaseHelper.db.rawUpdate(
      '''UPDATE trip SET last_modified = ? WHERE id = ?''',
      [formattedDate, id]);

  return sn;
}
