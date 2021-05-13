import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/Home/editcards.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/Home/editcards.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:tripmanager/temp.dart';

class Mycards extends StatefulWidget {
  //final User dummy;
  Mycards();
  @override
  _mycardstate createState() => _mycardstate();
}

class _mycardstate extends State<Mycards> {
  String type = "Debit Card";
  String cardnumber = "348492034";
  String account_number = '12345678';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Editcards()),
            );
          },
          label: Text("Add card"),
          backgroundColor: Colors.deepPurple,
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('My Cards'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple[200], Colors.purple[200]]),
                ),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: StreamBuilder<List<Map<dynamic, dynamic>>>(
                        stream: Stream.fromFuture(getCards()),
                        builder: (context,
                            AsyncSnapshot<List<Map<dynamic, dynamic>>>
                                snapshot) {
                          if (snapshot.hasData) {
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListView.builder(
                                    itemCount: snapshot.data.length,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      print(snapshot.data[index]);
                                      // return Text('Hi');

                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.red[500],
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: ListTile(
                                          isThreeLine: true,
                                          leading: Text(
                                            snapshot.data[index]["type"],
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          title: Text(
                                            snapshot.data[index]["number"],
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              Text(
                                                snapshot.data[index]
                                                    ["acc_number"],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () {
                                                  showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // user must tap button!
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Delete Card?'),
                                                        content: Text(
                                                            'Do you want to delete the card?'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: Text('No'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text('Yes'),
                                                            onPressed: () {
                                                              setState(() {
                                                                print(
                                                                    "deleted");
                                                                deleteCard(snapshot
                                                                            .data[
                                                                        index]
                                                                    ["number"]);
                                                              });
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Center(
                                child: Container(
                              child: Text(
                                'No Cards Added',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 100, color: Colors.black12),
                              ),
                            ));
                          }
                        })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//ListTile(
//                           //leading: Icon(Icons.add),
//                           title: Text(type+': '+ cardnumber,textScaleFactor: 1.5,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           ),
//                          // trailing: Icon(Icons.done),
//                           subtitle: Text('Acc no: '+ account_number,
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           selected: true,
//                         ),
