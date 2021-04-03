import 'package:tripmanager/Home/additem.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:tripmanager/classes/itemclass.dart';
import 'package:tripmanager/Home/newtrip.dart';

final balance = 206;

class YourTrip extends StatefulWidget {
  @override
  _YourTripState createState() => _YourTripState();
}

final User dummy = User(
    'Mohit Rajoria',
    '13-10-2000',
    'https://scontent.fjai2-2.fna.fbcdn.net/v/t1.0-9/95362727_2741172542678274_312620172575768576_o.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc=vbhflBRs8KgAX9GREOo&_nc_ht=scontent.fjai2-2.fna&oh=4041b60cd26a103cf3d82854fb469b08&oe=5F4AC925',
    34);

Icon favfun(int a) {
  if (a == 0) {
    return Icon(Icons.favorite_border);
  } else {
    return Icon(Icons.favorite);
  }
}

String stringfun(String as) {
  return as.substring(6, 10) + as.substring(3, 5) + as.substring(0, 2);
}

class _YourTripState extends State<YourTrip> {
  Future<String> _counter;
  Icon favicon = Icon(Icons.favorite_border);
  String dropdownValue = 'Select';

  Future<String> str;

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  callback1() {
    setState(() {});
  }

  Future<int> a = insertTripExpense('Trip to dsf', '11/01/2020', '14/01/2021',
      1, 2353.00, 1, 'sdaf', 'asdf', '12/02/2020', 908.23, 0);
  Future<int> b = insertTripExpense('Trip to dasf', '11/01/2020', '14/01/2021',
      1, 2345.00, 1, 'jgfed', 'jklo', '12/02/2020', 694.23, 0);
  Future<int> c = insertTripExpense('Trip to adsf', '11/01/2020', '14/01/2021',
      1, 1223.00, 1, 'sdaf', 'sdf', '12/02/2020', 0928.23, 0);

  int expense = 2200;
  String tripName = 'IIT Bombay';
  String date = '09/03/2021';

  @override
  void initState() {
    super.initState();
    // writing("a", "1");
    // reading("a");
    // writing("a", "1");
    // reading("a");
    // print('$_counter');
  }

  @override
  Widget build(BuildContext ct) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Trip Manager'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(dummy)),
              );
            }),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.all(10.0),
//              height: double.maxFinite,
              child: Center(
                  child: TextButton(
                child: Text(
                  "Sort By",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                onPressed: () {
                  setState(() {
                    if (dropdownValue == "Amount") {
                      // temporary.sort((a, b) => a.amount.compareTo(b.amount));
                    }
                    if (dropdownValue == "Title") {
                      // temporary.sort((a, b) => a.title.compareTo(b.title));
                    }
                    if (dropdownValue == "StartDate") {
                      // temporary.sort((a, b) =>
                      // stringfun(a.sdate).compareTo(stringfun(b.sdate)));
                    }
                  });
                },
              ))),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Select', 'Amount', 'StartDate', 'Title']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: StreamBuilder<List<Map<dynamic, dynamic>>>(
                    stream: Stream.fromFuture(getTripElements(1)),
                    builder: (context,
                        AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            ListView.builder(
                              itemCount: snapshot.data.length,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext ctxt, int index) {
                                print(snapshot.data[index]);
                                // return Text('Hi');
                                if (snapshot.data[index]['archive'] == 0) {
                                  return new Trip(
                                    snapshot.data[index]["id"],
                                    snapshot.data[index]["total"],
                                    snapshot.data[index]["title"],
                                    snapshot.data[index]["start_date"],
                                    snapshot.data[index]["end_date"],
                                    () {
                                      final snackBar = SnackBar(
                                        content: Text('Item Deleted'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            deleteTrip(
                                                snapshot.data[index]["id"]);
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);

                                      setState(() {
                                        // temporary.removeAt(index);
                                        deleteTrip(snapshot.data[index]["id"]);
                                      });
                                    },
                                    () {
                                      // showInSnackBar("added  removed from Favourites");
                                      final snackBar = SnackBar(
                                        content: Text('Favourites Modified'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);

                                      setState(() {
                                        int k = 0;
                                        if (snapshot.data[index]['fav'] == 1) {
                                          k = 0;
                                        } else {
                                          k = 1;
                                        }
                                        favTrip(snapshot.data[index]["id"], k);
                                      });
                                    },
                                    () {
                                      final snackBar = SnackBar(
                                        content: Text('Item Archived'),
                                        action: SnackBarAction(
                                          label: 'Undo',
                                          onPressed: () {
                                            // Some code to undo the change.
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);

                                      setState(() {
                                        int k = snapshot.data[index]["archive"];
                                        if (k == 0) {
                                          k = 1;
                                        } else {
                                          k = 0;
                                        }
                                        archiveTrip(
                                            snapshot.data[index]["id"], k);
                                      });
                                    },
                                    favfun(snapshot.data[index]["fav"]),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "Add New Trip",
          style: TextStyle(fontSize: 15),
        ),
        icon: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
