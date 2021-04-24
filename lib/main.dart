import 'package:flutter/material.dart';
import 'package:tripmanager/dashboard.dart';
import 'package:tripmanager/homepage.dart';
import 'package:tripmanager/temp.dart';

import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.initInjection();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balance Sheet',
      home: Homepage(),
    );
  }
}
