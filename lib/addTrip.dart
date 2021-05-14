import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String budget_head = '0';
  String last_modified;
  double advance = 0;
  int archive;
  DateTime now;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    now = DateTime.now();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    height: 600,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Text(
                            "Adding Trip",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          Expanded(
                            child: SizedBox(height: 10),
                            flex: 1,
                          ),
                          TextFormField(
                            maxLength: 25,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: (value) =>
                                (value == null || value.isEmpty)
                                    ? 'Required Field'
                                    : null,
                            decoration: InputDecoration(
                              labelText: 'Enter Title',
                              enabledBorder: OutlineInputBorder(),
                              suffixText: '*',
                              suffixStyle: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          Expanded(
                            child: SizedBox(height: 10),
                            flex: 1,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  // value: 1,
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('Yes'), value: 1),
                                    DropdownMenuItem(
                                        child: Text('No'), value: 0),
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    labelText: 'Completed',
                                    suffixText: '*',
                                    suffixStyle: TextStyle(
                                      color: Colors.red,

                                    ),
                                  ),

                                  // validator : (value) => (value == null || value.isEmpty) ? 'Required Field' : null,
                                  validator : (value) => (value == null) ? 'Required Field' : null,
                                  onChanged: (value) {
                                    complete = value;
                                  },
                                ),
                                // flex: 3,
                              ),
                              // Expanded(child: SizedBox(width: 10), flex: 1,),
                              Expanded(
                                child: SizedBox(height: 10),
                              ),
                              Expanded(
                                child: DateTimePicker(
                                  type: DateTimePickerType.date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  initialDate: DateTime.now(),
                                  decoration: InputDecoration(
                                    suffixText: '*',
                                    suffixStyle: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  dateLabelText: 'Start Date',
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                  onChanged: (value) {
                                    start_date = DateTime.parse(value);
                                  },
                                ),
                                // flex: 3,
                              ),
                            ],
                          ),

                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          // Expanded(child: SizedBox(height: 10), flex: 1,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Advance',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              advance = double.parse(value);
                            },
                          ),
                          // Expanded(child: SizedBox(height: 10), flex: 1,),
                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Budget Head',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              budget_head = value;
                            },
                          ),
                          // Expanded(child: SizedBox(height: 10), flex: 1,),
                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              note = value;
                            },
                          ),
                          // Expanded(child: SizedBox(height: 10), flex: 1,),
                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  insertTripExpense(
                                      title,
                                      DateFormat('yyyy-MM-dd')
                                          .format(start_date),
                                      end_date,
                                      complete,
                                      0,
                                      0,
                                      note,
                                      budget_head,
                                      DateFormat('yyyy-MM-dd – kk:mm')
                                          .format(now),
                                      advance,
                                      0);
                                  this.widget.callback();
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Create Trip')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
