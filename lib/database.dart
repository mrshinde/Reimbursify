import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "reimbursement1.db");
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Database get db {
    return _db;
  }

  // final int tripid;
  // final int serial_number;
  // final String type;
  // final String details;
  // final double amount_paid;
  // final String receipt_details;
  // final String receipt_address;
  // final String receipt_location;
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE travel (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,dep_time TEXT ,dep_date TEXT,dep_station TEXT, arr_time TEXT, arr_date TEXT,arr_station TEXT,mot TEXT,km REAL,fare REAL,pnr TEXT,remarks TEXT,ticket_address TEXT,receipt_location TEXT)');
    await db.execute(
        'CREATE TABLE otherexpense (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,type TEXT,details TEXT,amount_paid REAL,receipt_details TEXT,receipt_address TEXT,receipt_location TEXT,date TEXT)');
    await db.execute(
        'CREATE TABLE trip (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, start_date TEXT, end_date TEXT, complete INTEGER, total REAL, fav INTEGER, note TEXT, budget_head TEXT, last_modified TEXT, advance REAL, archive INTEGER)');
    await db.execute(
<<<<<<< HEAD
        'CREATE TABLE personalexpense (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,type TEXT,details TEXT,amount_paid REAL,date TEXT)');
=======
        'CREATE TABLE profile (uid TEXT, name TEXT, id TEXT, dep TEXT ,designation TEXT, grade_pay TEXT, acc_number TEXT, ifsc_code TEXT,google TEXT)');
>>>>>>> fae8bd299ffac6b6c759e44795db3e57f3ea54ab
  }
}

class Injection {
  static DatabaseHelper _databaseHelper = DatabaseHelper();
  static Injector injector;

  static Future initInjection() async {
    await _databaseHelper.initDb();

    injector = Injector.getInjector();

    injector.map<DatabaseHelper>((i) => _databaseHelper, isSingleton: true);
  }
}
