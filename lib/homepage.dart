// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tripmanager/Home/faq.dart';
import 'package:tripmanager/classes/profileclass.dart' as p;
import 'package:tripmanager/main.dart';
import 'package:tripmanager/trip.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share/share.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';
import 'package:path/path.dart' as pth;
import 'database.dart';
import 'package:tripmanager/viewreimbursements.dart';

// import 'package:tripmanager/classes/profileclass.dart';

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

Future<int> _onImport(BuildContext context) async {
  FilePickerResult result = await FilePicker.platform.pickFiles();
  if (result != null) {
    List<io.File> files = result.paths.map((path) => io.File(path)).toList();
    String fileName = files[0].path.split('/').last;
    String extension = fileName.split('.').last;
    if (extension == 'db') {
      io.Directory documentsDirectory =
          await getApplicationDocumentsDirectory();

      // await deleteDatabase(path);
      // await deleteDatabase(documentsDirectory.path);

      var file = await moveFile(
          files[0], documentsDirectory.path + "/" + "reimbursement1.db");
      return 1;
    } else {
      return -1;
    }
    // Phoenix.rebirth(context);
    // RestartWidget.restartApp(context);
    // open the database
    // await Injection.initInjection();
    // Database _db = await openDatabase(
    //     documentsDirectory.path + "/" + "reimbursement1.db");
  }
  return 0;
}

class ImportWidget extends StatefulWidget {
  int flag = -2;
  @override
  _ImportWidgetState createState() => _ImportWidgetState();
}

class _ImportWidgetState extends State<ImportWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: (() {
        if (widget.flag == -2) {
          return Text(
            'The App needs to be restarted after import.',
            style: TextStyle(color: Colors.red),
          );
        } else if (widget.flag == 1) {
          return Text(
            'Import Successful! Please restart the App.',
            style: TextStyle(color: Colors.red),
          );
        } else if (widget.flag == -1) {
          return Text(
            'Wrong file selected.',
            style: TextStyle(color: Colors.red),
          );
        } else {
          return Text(
            'No File Selected.',
            style: TextStyle(color: Colors.red),
          );
        }
      }()),
      content: Text(''),
      actions: <Widget>[
        (() {
          if (widget.flag == 1 || widget.flag == 0 || widget.flag == -1) {
            return Container();
          } else {
            return TextButton(
              child: Text('Continue'),
              onPressed: () async {
                int x = await _onImport(context);
                setState(() {
                  widget.flag = x;
                });
                print(x);
              },
            );
          }
        }()),
        TextButton(
          child: Text('Back'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String path;
  List<String> databasePaths = [];
  Future<p.Profile> user_profile;
  Future<List<Map<String, dynamic>>> cards;

  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {}));
    super.initState();
    cards = p.getCards();
    user_profile = p.getProfileById('1');
    // WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  int flag = -2;
  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 'Export':
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Continue to Export Database file',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(''),
              actions: <Widget>[
                TextButton(
                  child: Text('Continue'),
                  onPressed: () {
                    _onShare(context);
                  },
                ),
                TextButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        break;
      case 'Import':
        showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return ImportWidget();
          },
        );
        break;
    }
  }

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

  Future<int> _onImport(BuildContext context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      List<io.File> files = result.paths.map((path) => io.File(path)).toList();
      String fileName = files[0].path.split('/').last;
      String extension = fileName.split('.').last;
      if (extension == 'db') {
        io.Directory documentsDirectory =
            await getApplicationDocumentsDirectory();

        // await deleteDatabase(path);
        // await deleteDatabase(documentsDirectory.path);

        var file = await moveFile(
            files[0], documentsDirectory.path + "/" + "reimbursement1.db");
        return 1;
      } else {
        return -1;
      }
      // Phoenix.rebirth(context);
      // RestartWidget.restartApp(context);
      // open the database
      // await Injection.initInjection();
      // Database _db = await openDatabase(
      //     documentsDirectory.path + "/" + "reimbursement1.db");
    }
    return 0;
  }

  @override
  Widget build(BuildContext coxntext) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            PopupMenuButton<String>(
              onSelected: (item) => SelectedItem(context, item),
              itemBuilder: (BuildContext context) {
                return {'Import', 'Export'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          // actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: FutureBuilder<p.Profile>(
                future: user_profile,
                builder:
                    (BuildContext context, AsyncSnapshot<p.Profile> snapshot) {
                  if (snapshot.hasData) {
                    return Text('Welcome ' + snapshot.data.name);
                  } else {
                    return Text('Welcome');
                  }
                }),
          ),
          // title: Text(
          //   'Tripiva',
          //   style: TextStyle(fontSize: 30),
          // ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                              elevation: 10,
                              color: Colors.purple[200],
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
                                      color: Colors.black54,
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
                              color: Colors.purple[200],
                              elevation: 10,
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
                                    Icon(Icons.card_travel,
                                        size: 100, color: Colors.black54),
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
                              color: Colors.purple[200],
                              elevation: 10,
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
                                      color: Colors.black54,
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
                              color: Colors.purple[200],
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Faq()),
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.question_answer,
                                      size: 100,
                                      color: Colors.black54,
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
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  alignment: Alignment.centerLeft,
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: cards,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if (snapshot.hasData && snapshot.data.length == 2) {
                          return Container(
                              child: Text(
                            "*Add Card in Profile section",
                            style: TextStyle(color: Colors.red),
                          ));
                        } else {
                          return Container();
                        }
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Image(image: AssetImage('assets/logo3.png')),
                ),

                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       RaisedButton(
                //         color: Colors.purple[200],
                //         onPressed: () {
                // showDialog<void>(
                //   context: context,
                //   barrierDismissible: false, // user must tap button!
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text(
                //         'Restart Application after Importing Database File.',
                //         style: TextStyle(color: Colors.red),
                //       ),
                //       content: Text(''),
                //       actions: <Widget>[
                //         TextButton(
                //           child: Text('Continue'),
                //           onPressed: () {
                //             _onImport(context);
                //           },
                //         ),
                //         TextButton(
                //           child: Text('Back'),
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //         ),
                //                 ],
                //               );
                //             },
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text(
                //             'Import',
                //             style: TextStyle(fontSize: 30),
                //           ),
                //         ),
                //       ),
                //       RaisedButton(
                //         color: Colors.purple[200],
                //         onPressed: () {
                //           showDialog<void>(
                //             context: context,
                //             barrierDismissible: false, // user must tap button!
                //             builder: (BuildContext context) {
                //               return AlertDialog(
                //                 title: Text(
                //                   'Continue to Export Database file',
                //                   style: TextStyle(color: Colors.red),
                //                 ),
                //                 content: Text(''),
                //                 actions: <Widget>[
                //                   TextButton(
                //                     child: Text('Continue'),
                //                     onPressed: () {
                //                       _onShare(context);
                //                     },
                //                   ),
                //                   TextButton(
                //                     child: Text('Back'),
                //                     onPressed: () {
                //                       Navigator.of(context).pop();
                //                     },
                //                   ),
                //                 ],
                //               );
                //             },
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text(
                //             'Export',
                //             style: TextStyle(fontSize: 30),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 30, 8, 8),
                  child: Container(
                    height: 50,
                    child: Text('Developed by CSE IIT Ropar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
