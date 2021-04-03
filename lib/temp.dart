import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/Home/additem.dart';
import 'package:tripmanager/addexpense.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/item2.dart';
import 'classes/tripclass.dart';
import 'classes/itemclass.dart';
import 'package:tripmanager/Home/item.dart';
import 'classes/travelexpense.dart';

bool _value = false;

class Temp extends StatefulWidget {
  Temp(
    this.trip_id,
  );
  final int trip_id;

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  callback1() {
    setState(() {});
  }

  double expense = 2200;
  String tripName = 'IIT Bombay';
  String date = '09/03/2021';

  List<bool> isSelected = [true, false, false];
  bool isTravelEmpty = false;
  bool isOtherEmpty = false;

  @override
  Widget build(BuildContext context) {
    tripclass trip;
    getTripById(widget.trip_id).then((value) {
      trip = value;
    });
    while (true) {
      if (trip != null) break;
    }
    expense = trip.total;
    tripName = trip.title;
    date = trip.start_date;

    // print(a);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue, Colors.purple])),
              // height: 200,
              // color: Colors.,
              child: Row(
                children: [
                  Container(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            '₹ ' + expense.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            tripName,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 30),
                          child: Text(date),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          // color: Colors.red,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                          child: Text(
                            'Last Modified '
                            '18-03-2021',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.blue, Colors.purple])),
                // color: Colors.lightGreen,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (() {
                              if (isSelected[0] == true) {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'All',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              } else {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.purple, width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    setState(() {
                                      isSelected[0] = true;
                                      isSelected[1] = false;
                                      isSelected[2] = false;
                                    });
                                  },
                                  child: Text(
                                    'All',
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                );
                              }
                            }()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (() {
                              if (isSelected[1] == true) {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'Travel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              } else {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.purple, width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    setState(() {
                                      isSelected[1] = true;
                                      isSelected[0] = false;
                                      isSelected[2] = false;
                                    });
                                  },
                                  child: Text(
                                    'Travel',
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                );
                              }
                            }()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (() {
                              if (isSelected[2] == true) {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {},
                                  child: Text(
                                    'Others',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              } else {
                                return RaisedButton(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.purple, width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    setState(() {
                                      isSelected[2] = true;
                                      isSelected[1] = false;
                                      isSelected[0] = false;
                                    });
                                  },
                                  child: Text(
                                    'Others',
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                );
                              }
                            }()),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        // height: 200,
                        // color: Colors.purple,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                          // border: Border.all(
                          //   width: 3,
                          //   // color: Colors.green,
                          //   style: BorderStyle.solid,
                          // ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(),
                              (() {
                                if (isSelected[0] == true ||
                                    isSelected[1] == true) {
                                  return StreamBuilder<
                                          List<Map<dynamic, dynamic>>>(
                                      stream: Stream.fromFuture(getElements(1)),
                                      builder: (context,
                                          AsyncSnapshot<
                                                  List<Map<dynamic, dynamic>>>
                                              snapshot) {
                                        if (snapshot.hasData) {
                                          isTravelEmpty = false;
                                          return Column(
                                            children: [
                                              ListView.builder(
                                                itemCount: snapshot.data.length,
                                                primary: false,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  print(snapshot.data[index]);
                                                  // return Text('Hi');
                                                  return new Item(
                                                    snapshot.data[index]
                                                        ["tripid"],
                                                    snapshot.data[index]
                                                        ["serial_number"],
                                                    snapshot.data[index]
                                                        ["dep_time"],
                                                    snapshot.data[index]
                                                        ["dep_date"],
                                                    snapshot.data[index]
                                                        ["dep_station"],
                                                    snapshot.data[index]
                                                        ["arr_time"],
                                                    snapshot.data[index]
                                                        ["arr_date"],
                                                    snapshot.data[index]
                                                        ["arr_station"],
                                                    snapshot.data[index]["mot"],
                                                    snapshot.data[index]["km"],
                                                    snapshot.data[index]
                                                        ["fare"],
                                                    snapshot.data[index]["pnr"],
                                                    snapshot.data[index]
                                                        ["remarks"],
                                                    snapshot.data[index]
                                                        ["ticket_address"],
                                                    snapshot.data[index]
                                                        ["receipt_location"],
                                                    callback1,
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        } else {
                                          isTravelEmpty = true;
                                          return Container();
                                        }
                                      });
                                } else {
                                  return Container();
                                }
                              }()),
                              (() {
                                if (isSelected[0] == true ||
                                    isSelected[2] == true) {
                                  return StreamBuilder<
                                          List<Map<dynamic, dynamic>>>(
                                      stream: Stream.fromFuture(
                                          getElementsOtherExpense(1)),
                                      builder: (context,
                                          AsyncSnapshot<
                                                  List<Map<dynamic, dynamic>>>
                                              snapshot) {
                                        if (snapshot.hasData) {
                                          // print("Hi in");
                                          // print(isSelected);
                                          isOtherEmpty = false;
                                          return Column(
                                            children: [
                                              ListView.builder(
                                                itemCount: snapshot.data.length,
                                                primary: false,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  print(snapshot.data[index]);
                                                  return Item2(
                                                      1,
                                                      0,
                                                      'Food',
                                                      'Stay at IIT Bombay hostel',
                                                      1000,
                                                      'sdfgasdg',
                                                      'GMail',
                                                      'NA',
                                                      '21-01-21',
                                                      callback1);
                                                  // return new Item2(
                                                  //   snapshot.data[index]["tripid"],
                                                  //   snapshot.data[index]
                                                  //       ["serial_number"],
                                                  //   snapshot.data[index]
                                                  //       ["type"],
                                                  //   snapshot.data[index]
                                                  //       ["details"],
                                                  //   snapshot.data[index]
                                                  //       ["amount_paid"],
                                                  //   snapshot.data[index]
                                                  //       ["receipt_details"],
                                                  //   snapshot.data[index]
                                                  //       ["receipt_address"],
                                                  //   snapshot.data[index]
                                                  //       ["receipt_location"],
                                                  //   snapshot.data[index]["date"],
                                                  //   callback1,
                                                  // );
                                                },
                                              ),
                                              Container(
                                                child: Image.network(
                                                  'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.flaticon.com%2Ficons%2Fpng%2F512%2F339%2F339821.png&f=1&nofb=1',
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          print("hi");
                                          isOtherEmpty = true;
                                          return Container();
                                        }
                                      });
                                } else {
                                  return Container();
                                }
                              }()),
                              (() {
                                if (isSelected[0] == true) {
                                  if (isOtherEmpty == true &&
                                      isTravelEmpty == true) {
                                    return Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                            'Welcome! You have created a new Trip.',
                                            style: TextStyle(fontSize: 40),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                            'Add an Expense to view here',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                } else if (isSelected[1] == true) {
                                  if (isTravelEmpty == true) {
                                    return Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                            'Add a Travel Expense to view here',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                } else if (isSelected[2] == true) {
                                  if (isOtherEmpty == true) {
                                    return Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Text(
                                            'Add a Non Travel expense to view here',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                }
                              }())
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                return MyHomePage(1, callback1);
              });
        },
        elevation: 15,
        splashColor: Colors.blue,
        backgroundColor: Colors.green,
        icon: Icon(Icons.addchart_rounded),
        label: Text("Add Expense"),
      ),
    );
  }
}
