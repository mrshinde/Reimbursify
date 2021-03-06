import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/Home/attachments.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/edit.dart';

import '../temp.dart';

Map<String, String> parseComment(String comment) {
  final regex = RegExp(
      r'^Payment made through card which has type: (.+), account number: (.*), card number: (.*);(.*)$');
  final match = regex.firstMatch(comment);
  if (match == null)
    return null;
  else {
    return {
      'type': match.group(1),
      'acc_no': match.group(2),
      'number': match.group(3),
      'additional_comments': match.group(4)
    };
  }
}

final snackBar = SnackBar(content: Text('Expense Deleted!'));

// tripid:,serial_number:,dep_time: ,dep_date: ,dep_station: ,arr_time: ,arr_date: ,arr_station: ,mot: ,km: ,fare: ,pnr: ,remarks: ,ticket_address: ,receipt_location: ,

class Item extends StatefulWidget {
  Item(
      this.tripid,
      this.serial_number,
      this.dep_time,
      this.dep_date,
      this.dep_station,
      this.arr_time,
      this.arr_date,
      this.arr_station,
      this.mot,
      this.km,
      this.fare,
      this.pnr,
      this.remarks,
      this.ticket_address,
      this.receipt_location,
      this.currency,
      this.callback);
  // String sign;
  // double amount;
  // String note;
  // String date;
  Function() callback;
  final int tripid;
  final int serial_number;
  final String dep_time;
  final String dep_date;
  final String dep_station;
  final String arr_time;
  final String arr_date;
  final String arr_station;
  final String mot;
  final double km;
  final double fare;
  final String pnr;
  final String remarks;
  final String ticket_address;
  final String receipt_location;
  final String currency;
  String type;
  String numb;
  String acc_no;
  String payment_info;
  String add_rem;
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    print(parseComment(widget.remarks));
    if (parseComment(widget.remarks) != null) {
      widget.type = parseComment(widget.remarks)['type'];
      widget.acc_no = parseComment(widget.remarks)['acc_no'];
      widget.numb = parseComment(widget.remarks)['number'];
      widget.add_rem = parseComment(widget.remarks)['additional_comments'];
    }
    if (widget.type == 'Cash') {
      widget.payment_info = 'Cash';
    } else if (widget.type == 'Other') {
      widget.payment_info = 'Other';
    } else if (widget.type == null ||
        widget.acc_no == null ||
        widget.numb == null) {
      widget.payment_info = 'N.A.';
    } else {
      widget.payment_info = 'Payment made through Card Type: ' +
          widget.type +
          ' with No.: ' +
          widget.numb +
          ' associated with account no.: ' +
          widget.acc_no;
    }
    return Container(
      // height: 100,
      // color: Colors.white,
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(width: 2, color: Colors.blue),
          ),
          elevation: 10,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: (() {
                        if (widget.mot == "Train" || widget.mot == "Metro") {
                          return Icon(
                            Icons.train,
                            color: Colors.indigo,
                            size: 50,
                          );
                        } else if (widget.mot == "Roadways" ||
                            widget.mot == "Taxi" ||
                            widget.mot == "Bus" ||
                            widget.mot == "Own Car" ||
                            widget.mot == "Auto") {
                          return Icon(
                            Icons.add_road,
                            color: Colors.indigo,
                            size: 50,
                          );
                        } else if (widget.mot == "Airways") {
                          return Icon(
                            Icons.airplanemode_on_rounded,
                            color: Colors.indigo,
                            size: 50,
                          );
                        } else if (widget.mot == "Steamer") {
                          return Icon(
                            Icons.directions_boat_rounded,
                            color: Colors.indigo,
                            size: 50,
                          );
                        } else if (widget.mot == "Other") {
                          return Icon(
                            Icons.bike_scooter,
                            color: Colors.indigo,
                            size: 50,
                          );
                        }
                      }())),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 1,
                    height: 40,
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.mot,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepPurple),
                            ),
                            (() {
                              print("Hi23435");
                              print(this.widget.dep_station);
                              print("Hsdfasdf");
                              print(this.widget.arr_station);
                              return Container();
                            }()),
                            Text(
                              this.widget.dep_station +
                                  ' to ' +
                                  this.widget.arr_station,
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width * (0.2),
                            child: Text(
                              this.widget.currency +
                                  ' ' +
                                  this.widget.fare.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            ),
                          ),
                          Text(
                            this.widget.dep_date,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  child: (() {
                if (selected) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      // border: Border.all(
                      //   width: 3,
                      //   // color: Colors.green,
                      //   style: BorderStyle.solid,
                      // ),
                    ),

                    // height: 20,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 1,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * (0.8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (0.4),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (0.2),
                                              child: Text(
                                                'Mode of Travel :',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    (0.2),
                                                child: Text(widget.mot)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (0.4),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (0.2),
                                              child: Text(
                                                'Distance :',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (0.2),
                                              child: (() {
                                                if (widget.km == 0.0) {
                                                  return Text('N.A.');
                                                } else {
                                                  return Text(
                                                      widget.km.toString());
                                                }
                                              }()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * (0.8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (0.3),
                                            child: Text(
                                              widget.dep_station,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        Text('Dep. Date : ' + widget.dep_date),
                                        Text('Dep. Time : ' + widget.dep_time),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                (0.3),
                                            child: Text(
                                              widget.arr_station,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                        Text('Arr. Date : ' + widget.arr_date),
                                        Text('Arr. Time : ' + widget.arr_time),
                                      ],
                                    )
                                  ],
                                ),
                              ), // ,mot: ,km: ,pnr: ,remarks: ,ticket_address: ,receipt_location: ,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        (0.4),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Payment Mode',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (widget.payment_info),
                                          // Text(widget.remarks),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        (0.4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'PNR/Ticket No.',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(widget.pnr),
                                      ],
                                    ),
                                  ),
                                  // Text('Receipt : ' + widget.receipt_location),
                                ],
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Column(
                              //       children: [
                              //         Container(
                              //           child: Text(
                              //             'Payment Mode',
                              //             style: TextStyle(
                              //                 color: Colors.deepPurple,
                              //                 fontWeight: FontWeight.bold),
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.all(8.0),
                              //           child: Container(
                              //               width: MediaQuery.of(context)
                              //                       .size
                              //                       .width *
                              //                   0.75,
                              //               child: Text(widget.payment_info)),
                              //         ),
                              //       ],
                              //     )
                              //   ],
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        (0.4),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Remarks',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(widget.add_rem),
                                        // Text(widget.remarks),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        (0.4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Receipt Location',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(widget.ticket_address),
                                      ],
                                    ),
                                  ),
                                  // Text('Receipt : ' + widget.receipt_location),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            // border: Border.all(
                            //   width: 3,
                            //   // color: Colors.green,
                            //   style: BorderStyle.solid,
                            // ),
                          ),
                          // color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Expense?'),
                                        content: Text(
                                            'Do you want to delete the expense?'),
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
                                              Future<int> temp = deleteItem(
                                                  this.widget.serial_number);
                                              tripclass temp2 =
                                                  await getTripById(
                                                      widget.tripid);
                                              double total =
                                                  temp2.total - widget.fare;
                                              updateAmount(
                                                  widget.tripid, total);
                                              updateLastModified(widget.tripid);
                                              setState(() {
                                                print("deleted");
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);

                                                widget.callback();
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ct) {
                                          return editTravelForm(
                                              widget.callback,
                                              widget.serial_number,
                                              ct,
                                              Travel(
                                                  tripid: widget.tripid,
                                                  serial_number:
                                                      widget.serial_number,
                                                  dep_time: widget.dep_time,
                                                  dep_date: widget.dep_date,
                                                  dep_station:
                                                      widget.dep_station,
                                                  arr_time: widget.arr_time,
                                                  arr_date: widget.arr_date,
                                                  arr_station:
                                                      widget.arr_station,
                                                  mot: widget.mot,
                                                  km: widget.km,
                                                  fare: widget.fare,
                                                  pnr: widget.pnr,
                                                  remarks: widget.remarks,
                                                  ticket_address:
                                                      widget.ticket_address,
                                                  currency: widget.currency,
                                                  receipt_location:
                                                      widget.receipt_location));
                                        });
                                  }),
                              IconButton(
                                  icon: Icon(Icons.attachment),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ct) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: attachments(
                                                this.widget.receipt_location,
                                                this.widget.serial_number,
                                                this.widget.tripid,
                                                this.widget.callback),
                                          );
                                        });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }())),
            ],
          ),
        ),
      ),
    );
  }
}
// ListTile(
// title: Text(note,style: TextStyle(fontSize: 20.0),),
// leading: Text(amount.toString(),style: TextStyle(fontSize: 30.0,color: Colors.green),),
// subtitle: Text(date),
// ),
