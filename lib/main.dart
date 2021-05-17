import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripmanager/Home/firstsignup.dart';
import 'package:tripmanager/Home/signup.dart';
import 'package:tripmanager/dashboard.dart';
import 'package:tripmanager/homepage.dart';
import 'package:tripmanager/temp.dart';

import 'database.dart';

Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("loggedIn") == null) {
    prefs.setBool("loggedIn", false);
  }
  final log = prefs.getBool("loggedIn");
  //prefs.setBool("loggedIn", true);
  return log;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.initInjection();
  if (await isLoggedIn()) {
    runApp(MyApp1());
  } else {
    runApp(MyApp2());
  }
}

//class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

//class _MyAppState extends State<MyApp> {
//   Future<bool> isLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool("loggedIn");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Balance Sheet',
//         home: FutureBuilder(
//           future: isLoggedIn(),
//           builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//             if (snapshot.hasData) {
//               return snapshot.data ? Homepage() : Signup();
//             }
//             return Signup(); // noop, this builder is called again when the future completes
//           },
//         )          //Homepage(),
//     );
//   }
// }
class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balance Sheet',
      home: Homepage(),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balance Sheet',
      home: LogInInfo(),
    );
  }
}
