import 'package:flutter/material.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/edit.dart';

import '../temp.dart';

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
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
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
                        if (widget.mot == "Train") {
                          return Icon(
                            Icons.train,
                            color: Colors.indigo,
                            size: 50,
                          );
                        } else if (widget.mot == "Roadways") {
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
                              'Travel',
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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          '₹ ' + this.widget.fare.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        Text(
                          this.widget.dep_date,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Mode of Travel :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(widget.mot),
                                    Text(
                                      'Distance :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(widget.km.toString()),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.dep_station,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.red),
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
                                        child: Text(
                                          widget.arr_station,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.red),
                                        ),
                                      ),
                                      Text('Arr. Date : ' + widget.arr_date),
                                      Text('Arr. Time : ' + widget.arr_time),
                                    ],
                                  )
                                ],
                              ), // ,mot: ,km: ,pnr: ,remarks: ,ticket_address: ,receipt_location: ,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 1,
                                  color: Colors.blue,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        (0.5),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Remarks',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(widget.remarks),
                                      ],
                                    ),
                                  ),
                                  Container(
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
                                                  receipt_location:
                                                      widget.receipt_location));
                                        });
                                  }),
                              IconButton(
                                  icon: Icon(Icons.attachment),
                                  onPressed: () {}),
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
