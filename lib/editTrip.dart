import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tripmanager/database.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'package:date_time_picker/date_time_picker.dart';
import './classes/travelexpense.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import './classes/otherexpense.dart';

class editTrip extends StatefulWidget {
  editTrip(this.callback, this.tripinstance);
  final tripclass tripinstance;
  Function() callback;
  @override
  _editTripState createState() => _editTripState();
}

class _editTripState extends State<editTrip> {
  Form tripform;
  Form tripDetails;
  Future<tripclass> _tripinstance;
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    title = this.widget.tripinstance.title;
    start_date = DateTime.parse(this.widget.tripinstance.start_date);
    complete = this.widget.tripinstance.complete;
    note = this.widget.tripinstance.note;
    budget_head = this.widget.tripinstance.budget_head;
    advance = this.widget.tripinstance.advance;
    now = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
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
                            "Edit Trip",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          Expanded(
                            child: SizedBox(height: 10),
                            flex: 1,
                          ),
                          TextFormField(
                            initialValue: title,
                            maxLength: 23,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter Title',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          Expanded(
                            child: SizedBox(height: 10),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('Yes'), value: 1),
                                    DropdownMenuItem(
                                        child: Text('No'), value: 0),
                                  ],
                                  value: complete,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    labelText: 'Completed',
                                  ),
                                  onChanged: (value) {
                                    complete = value;
                                  },
                                ),
                              ),
                              Expanded(child: SizedBox(height: 10)),
                              Expanded(
                                child: DateTimePicker(
                                  type: DateTimePickerType.date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  initialValue: start_date.toString(),
                                  validator: (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Required Field'
                                          : null,
                                  initialDate: start_date,
                                  dateLabelText: 'Start Date',
                                  onChanged: (value) {
                                    start_date = DateTime.parse(value);
                                  },
                                ),
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
                            initialValue: advance.toString(),
                            onChanged: (value) {
                              advance = double.parse(value);
                            },
                          ),

                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Budget Head',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            initialValue: budget_head,
                            onChanged: (value) {
                              budget_head = value;
                            },
                          ),

                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          TextFormField(
                            initialValue: note,
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              enabledBorder: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              note = value;
                            },
                          ),
                          Expanded(
                            child: SizedBox(height: 10),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  updateTrip(
                                      this.widget.tripinstance.id,
                                      title,
                                      DateFormat('yyyy-MM-dd')
                                          .format(start_date),
                                      this.widget.tripinstance.end_date,
                                      complete,
                                      this.widget.tripinstance.total,
                                      this.widget.tripinstance.fav,
                                      note,
                                      this.widget.tripinstance.budget_head,
                                      DateFormat('yyyy-MM-dd – kk:mm')
                                          .format(now),
                                      this.widget.tripinstance.advance,
                                      this.widget.tripinstance.archive);
                                  updateLastModified(
                                      this.widget.tripinstance.id);
                                  this.widget.callback();
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Update Trip')),
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
