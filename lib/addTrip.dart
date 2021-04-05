import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tripmanager/database.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:date_time_picker/date_time_picker.dart';
import './classes/travelexpense.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import './classes/otherexpense.dart';

class addTrip extends StatefulWidget {
  addTrip(this.callback);
  Function() callback;
  @override
  _addTripState createState() => _addTripState();
}

class _addTripState extends State<addTrip> {
  Form tripform;
  Form tripDetails;
  String title;
  var start_date;
  var end_date = "";
  int complete;
  double total;
  int fav;
  String note;
  String budget_head;
  String last_modified;
  double advance;
  int archive;
  DateTime now;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = DateTime.now();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                Container(
                  height: 400,
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height:10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Enter Title',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          // flex: 2,
                        ),
                        SizedBox(height:10),
                        Expanded(
                          child: DropdownButtonFormField(
                            items: [
                              DropdownMenuItem(child: Text('Yes'), value: 1),
                              DropdownMenuItem(
                                  child: Text('No'), value: 0),
                            ],
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              labelText: 'Completed',
                            ),
                            onChanged: (value) {
                              complete = value;
                            },
                          ),
                        ),

                        SizedBox(height:10),
                        Expanded(
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.now(),
                            dateLabelText: 'Start Date',
                            onChanged: (value) {
                              start_date = DateTime.parse(value);
                            },
                          ),

                        ),
                        SizedBox(height:10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              note = value;
                            },
                          ),
                          // flex: 2,
                        ),
                        SizedBox(height:10),
                        ElevatedButton(
                            onPressed: () {
                              insertTripExpense(title, DateFormat('yyyy-MM-dd').format(start_date), end_date, complete,
                                  0, 0, note, budget_head, DateFormat('yyyy-MM-dd – kk:mm').format(now), 0, 0);

                              this.widget.callback();
                              Navigator.pop(context);
                            },
                            child: Text('Create Trip')),

                      ],),
                  ),
                ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}




