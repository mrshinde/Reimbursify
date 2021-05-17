import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:tripmanager/classes/reimbursements.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tripmanager/reimitem.dart';

final snackBar = SnackBar(content: Text('File Deleted!'));

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  callback() {
    setState(() {
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text('Reimbursements'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<Map<dynamic, dynamic>>>(
            stream: Stream.fromFuture(getElementsReimbursements()),
            builder:
                (context, AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
              print(snapshot.connectionState);
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                // isTravelEmpty = false;
                return Column(
                  children: [
                    Container(),
                    ListView.builder(
                      itemCount: snapshot.data.length,
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        print(snapshot.data[index]);
                        // return Text('Hi');
                        return InkWell(
                          onTap: () async {
                            final _result = await OpenFile.open(
                                snapshot.data[index]['file_name']);
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(snackBar);
                            // callback();
                          },
                          child: new ItemR(
                              snapshot.data[index]['serial_number'],
                              snapshot.data[index]['file_name'],
                              snapshot.data[index]['type'],
                              snapshot.data[index]['title'],
                              snapshot.data[index]['date'],
                              callback),
                        );
                      },
                    ),
                  ],
                );
              } else {
                // isTravelEmpty = true;
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'No Entries',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
