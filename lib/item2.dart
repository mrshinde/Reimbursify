import 'package:flutter/material.dart';
import 'package:tripmanager/Home/attachothers.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:tripmanager/edit.dart';

import 'package:tripmanager/temp.dart';

final snackBar = SnackBar(content: Text('Expense Deleted!'));

// tripid:,serial_number:,dep_time: ,dep_date: ,dep_station: ,arr_time: ,arr_date: ,arr_station: ,mot: ,km: ,fare: ,pnr: ,remarks: ,ticket_address: ,receipt_location: ,

class Item2 extends StatefulWidget {
  Item2(
      this.tripid,
      this.serial_number,
      this.type,
      this.details,
      this.amount_paid,
      this.receipt_details,
      this.receipt_address,
      this.receipt_location,
      this.date,
      this.callback);
  // String sign;
  // double amount;
  // String note;
  final String date;
  Function() callback;
  final int tripid;
  final int serial_number;
  final String type;
  final String details;
  final double amount_paid;
  final String receipt_details;
  final String receipt_address;
  final String receipt_location;
  @override
  _Item2State createState() => _Item2State();
}

class _Item2State extends State<Item2> {
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
                      if (this.widget.type == "Stay") {
                        return Icon(
                          Icons.hotel,
                          color: Colors.indigo,
                          size: 50,
                        );
                      } else if (this.widget.type == "Food") {
                        return Icon(
                          Icons.food_bank,
                          color: Colors.indigo,
                          size: 50,
                        );
                      } else if (this.widget.type == "Insurance") {
                        return Icon(
                          Icons.ballot_rounded,
                          color: Colors.indigo,
                          size: 50,
                        );
                      } else if (this.widget.type == "Visa") {
                        return Icon(
                          Icons.wallet_travel,
                          color: Colors.indigo,
                          size: 50,
                        );
                      } else if (this.widget.type == "Registration Fees") {
                        return Icon(
                          Icons.dynamic_form_outlined,
                          color: Colors.indigo,
                          size: 50,
                        );
                      }
                    }()),
                  ),
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
                              this.widget.type,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepPurple),
                            ),
                            Text(
                              this.widget.details,
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
                          '₹ ' + this.widget.amount_paid.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        Text(
                          this.widget.date,
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
                                          'Receipt Details',
                                          style: TextStyle(
                                              color: Colors.deepPurple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(widget.receipt_details),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Receipt Location',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(widget.receipt_location),
                                    ],
                                  ),
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
                                              Future<int> temp =
                                                  deleteItemOtherExpense(this
                                                      .widget
                                                      .serial_number);
                                              tripclass temp2 =
                                                  await getTripById(
                                                      widget.tripid);
                                              double total = temp2.total -
                                                  widget.amount_paid;
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
                                          return editOtherForm(
                                              widget.callback,
                                              widget.serial_number,
                                              ct,
                                              OtherExpense(
                                                  tripid: widget.tripid,
                                                  serial_number:
                                                      widget.serial_number,
                                                  type: widget.type,
                                                  details: widget.details,
                                                  amount_paid:
                                                      widget.amount_paid,
                                                  receipt_details:
                                                      widget.receipt_details,
                                                  receipt_address:
                                                      widget.receipt_address,
                                                  receipt_location:
                                                      widget.receipt_location,
                                                  date: widget.date));
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
                                            child: attachments2(
                                                this.widget.receipt_address,
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
