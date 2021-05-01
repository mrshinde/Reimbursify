import 'package:tripmanager/Home/additem.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:tripmanager/addTrip.dart';
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
  String searchTitle = "";
  int search = 1;
  Future<String> str;
  Widget appBarTitle = new Text("Trips");
  Icon actionIcon = new Icon(Icons.search);

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
  }

  callback1() {
    setState(() {});
  }

  // Future<int> a = insertTripExpense('Trip to dsf', '11/01/2020', '14/01/2021',
  //     1, 2353.00, 1, 'sdaf', 'asdf', '12/02/2020', 908.23, 0);
  // Future<int> b = insertTripExpense('Trip to dasf', '11/01/2020', '14/01/2021',
  //     1, 2345.00, 1, 'jgfed', 'jklo', '12/02/2020', 694.23, 0);
  // Future<int> c = insertTripExpense('Trip to adsf', '11/01/2020', '14/01/2021',
  //     1, 1223.00, 1, 'sdaf', 'sdf', '12/02/2020', 0928.23, 0);

  int expense = 2200;
  String tripName = 'IIT Bombay';
  String date = '09/03/2021';




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ct) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: appBarTitle,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            }),
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (text) {
                      setState(() {
                        search = 1;
                        searchTitle = text;
                      });
                    },
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                  );
                } else {
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("Trips");
                }
              });
            },
          ),
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
                if (dropdownValue == "Select") {
                  search = 1;
                }
                if (dropdownValue == "Amount\u{2B06}") {
                  search = 4;
                }
                if (dropdownValue == "Amount\u{2B07}") {
                  search = 5;
                }
                if (dropdownValue == "Title\u{2B06}") {
                  search = 2;
                }
                if (dropdownValue == "Title\u{2B07}") {
                  search = 3;
                }
                if (dropdownValue == "StartDate\u{2B06}") {
                  search = 6;
                }
                if (dropdownValue == "StartDate\u{2B07}") {
                  search = 7;
                }
                if (dropdownValue == "Favourites") {
                  search = 8;
                }
                if (dropdownValue == "Archives") {
                  search = 9;
                }
              });
            },
            items: <String>['Select', 'Amount\u{2B06}', 'Amount\u{2B07}', 'StartDate\u{2B06}', 'StartDate\u{2B07}', 'Title\u{2B06}', 'Title\u{2B07}', 'Favourites', 'Archives']
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
                    stream: Stream.fromFuture(getTripbyAll(searchTitle, search)),
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
                                //Having True at this place means That tile will be shown otherwise not
                                //I can have if and else here to decide to show or not
                                //So what I want is Archive to be shown when it is arhive ie search is 9 or I am searching string ie search==1
                                if (snapshot.data[index]['archive'] == 0||search==9) {
                                  return new Trip(
                                    snapshot.data[index]["id"],
                                    snapshot.data[index]["total"],
                                    snapshot.data[index]["title"],
                                    snapshot.data[index]["start_date"],
                                    snapshot.data[index]["end_date"],
                                    () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                        false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Delete Trip?'),
                                            content: Text(
                                                'Do you want to delete the Trip?'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('No'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Yes'),
                                                onPressed: () async {
                                                  setState(() {
                                                    deleteTrip(snapshot.data[index]["id"]);
                                                    print("deleted");
                                                    final snackBar = SnackBar(
                                                      content: Text('Item Deleted'),
                                                    );
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(snackBar);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    () {
                                      // showInSnackBar("added  removed from Favourites");
                                      final snackBar = SnackBar(
                                        content: Text('Favourites Modified'),
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
        onPressed: () {
          showDialog(
              context: context,
              builder: (ct) {
                return addTrip(callback1);
              });
        },
        elevation: 15,
        splashColor: Colors.blue,
        backgroundColor: Colors.green,
        icon: Icon(Icons.addchart_rounded),
        label: Text("Add Trip"),
      ),
    );
  }
}
