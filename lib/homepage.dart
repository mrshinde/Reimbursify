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
    path = pth.join(documentsDirectory.path, "reimbursement1.db");
    databasePaths.clear();
    databasePaths.add(path);
    print(databasePaths);

    if (databasePaths.isNotEmpty) {
      await Share.shareFiles(databasePaths,
          text: "reimbursment1.db", subject: "subject");
      // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share("reimbursment1.db", subject: "subject");
      // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  _onImport(BuildContext context) async {
    FilePickerResult result =
    await FilePicker.platform.pickFiles(
      allowedExtensions: ['.db'],
    );
    List<io.File> files =
    result.paths.map((path) => io.File(path)).toList();

    io.Directory documentsDirectory =
    await getApplicationDocumentsDirectory();
    path = pth.join(
        documentsDirectory.path, "reimbursement1.db");

    await deleteDatabase(path);

    Uint8List data = await files[0].readAsBytes();
    List<int> bytes = data.buffer
        .asUint8List(data.offsetInBytes, data.lengthInBytes);
    await io.File(path).writeAsBytes(bytes);

    io.Directory documentsDirectorya =
    await getApplicationDocumentsDirectory();
    print(documentsDirectorya);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            'Tripiva',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                // padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.extent(
                    // primary: false,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    maxCrossAxisExtent: 300.0,
                    children: [
                      Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.person,
                                size: 100,
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(fontSize: 21),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YourTrip()),
                            );
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.card_travel,
                                size: 100,
                              ),
                              Text(
                                'My Trips',
                                style: TextStyle(fontSize: 21),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Icon(
                                Icons.picture_as_pdf,
                                size: 100,
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
                      Card(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Icon(
                                Icons.question_answer,
                                size: 100,
                              ),
                              Text(
                                'FAQ',
                                style: TextStyle(fontSize: 21),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      )
                      ,
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
