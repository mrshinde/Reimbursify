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
        'CREATE TABLE travel (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,dep_time TEXT ,dep_date TEXT,dep_station TEXT, arr_time TEXT, arr_date TEXT,arr_station TEXT,mot TEXT,km REAL,fare REAL,currency TEXT ,pnr TEXT,remarks TEXT,ticket_address TEXT,receipt_location TEXT)');
    await db.execute(
        'CREATE TABLE otherexpense (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,type TEXT,details TEXT,amount_paid REAL,currency TEXT,receipt_details TEXT,receipt_address TEXT,receipt_location TEXT,date TEXT)');
    await db.execute(
        'CREATE TABLE personalexpense (tripid INTEGER,serial_number INTEGER PRIMARY KEY AUTOINCREMENT,type TEXT,details TEXT,amount_paid REAL,currency TEXT,date TEXT)');
    await db.execute(
        'CREATE TABLE trip (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, start_date TEXT, end_date TEXT, complete INTEGER, total REAL, fav INTEGER, note TEXT, budget_head TEXT, last_modified TEXT, advance REAL, archive INTEGER)');
    await db.execute(
        'CREATE TABLE profile (uid TEXT PRIMARY KEY, name TEXT, id TEXT, dep TEXT ,designation TEXT, grade_pay TEXT, pay_scale TEXT, acc_number TEXT, ifsc_code TEXT,google TEXT)');
    await db.execute(
        'CREATE TABLE PaymentCard (type TEXT , number TEXT PRIMARY KEY, acc_number TEXT)');
    await db.execute(
        'CREATE TABLE reimbursements(serial_number INTEGER PRIMARY KEY AUTOINCREMENT,tripid INTEGER,title TEXT, type TEXT, file_name TEXT, date TEXT)');
    await db.execute(
      'INSERT INTO PaymentCard (type, number, acc_number) VALUES(\'Cash\', \'\', \'\')'
    );
    await db.execute(
      'INSERT INTO PaymentCard (type, number, acc_number) VALUES(\'Other\', \'---\', \'--\')'
    );
    await db.execute(
        'INSERT INTO profile (uid , name , id , dep  ,designation , grade_pay , pay_scale, acc_number , ifsc_code ,google ) VALUES(\'1\',\'--\',\'--\',\'--\',\'--\',\'--\',\'--\',\'--\',\'--\',\'--\'  )');
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
