import 'package:flutter/material.dart';
import 'package:tripmanager/trip.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share/share.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:path/path.dart' as pth;
import 'package:tripmanager/viewreimbursements.dart';
// import 'package:tripmanager/classes/profileclass.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String path;
  List<String> databasePaths = [];

  _onShare(BuildContext context) async {
    // final RenderBox box = context.findRenderObject() as RenderBox;
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path_db = pth.join(documentsDirectory.path, "reimbursement1.db");
    databasePaths.clear();
    databasePaths.add(path_db);
    print(databasePaths);

    if (databasePaths.isNotEmpty) {
      await Share.shareFiles(databasePaths, subject: "subject");
      // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share("reimbursment1.db", subject: "subject");
      // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  Future<io.File> moveFile(io.File sourceFile, String newPath) async {
    try {
      /// prefer using rename as it is probably faster
      /// if same directory path
      return await sourceFile.rename(newPath);
    } catch (e) {
      /// if rename fails, copy the source file
      final newFile = await sourceFile.copy(newPath);
      return newFile;
    }
  }

  _onImport(BuildContext context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      List<io.File> files = result.paths.map((path) => io.File(path)).toList();

      io.Directory documentsDirectory =
          await getApplicationDocumentsDirectory();

      // await deleteDatabase(path);
      // await deleteDatabase(documentsDirectory.path);

      var file = await moveFile(
          files[0], documentsDirectory.path + "/" + "reimbursement1.db");

      // open the database
      Database _db = await openDatabase(
          documentsDirectory.path + "/" + "reimbursement1.db");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Tripiva',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YourTrip()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.card_travel,
                                    size: 100,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    'My Trips',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forms()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    size: 100,
                                    color: Colors.purple,
                                  ),
                                  Center(
                                    // width: double.infinity,
                                    child: Text(
                                      'Reimbursements',
                                      style: TextStyle(fontSize: 21),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          child: Card(
                            child: InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.question_answer,
                                    size: 100,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    'FAQ',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: Colors.purple[200],
                      onPressed: () {
                        _onImport(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Import',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.purple[200],
                      onPressed: () {
                        _onShare(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Export',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Text('Made with love @IIT Ropar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
