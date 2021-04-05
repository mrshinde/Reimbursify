import 'package:flutter/material.dart';
import 'dart:async';
import '../database.dart';
import 'package:date_time_picker/date_time_picker.dart';
import './classes/travelexpense.dart';
import 'package:file_picker/file_picker.dart';
import './classes/otherexpense.dart';
import './classes/personal.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.trip_id, this.callback);
  Function() callback;
  final int trip_id;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Form travelform;
  Form travelDetails;
  final myFuture = Future.delayed(Duration(seconds: 3), () => 12);

  buildFormView(val) {
    if (val == 0) {
      var arrivalPlace,
          receiptLocation = '',
          arrivalDate,
          departurePlace,
          departureDate,
          km,
          fare,
          ticket_no,
          additional_comments,
          mode,
          ticketAddress;
      setState(() {
        travelDetails = Form(
            child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text('Train'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('Road'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Airplane'),
                        value: 2,
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Enter Mode of Travel',
                    ),
                    onChanged: (value) {
                      switch (value) {
                        case 0:
                          mode = 'Train';
                          break;
                        case 1:
                          mode = 'Roadways';
                          break;
                        case 2:
                          mode = 'Airways';
                      }
                    },
                  ),
                  flex: 1,
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                )
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'From',
                    hintText: 'Enter Departure Station',
                    prefixIcon: Icon(Icons.location_city),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    departurePlace = value;
                  },
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'To',
                    hintText: 'Enter Arrival Station',
                    prefixIcon: Icon(Icons.location_city),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    arrivalPlace = value;
                  },
                ),
                flex: 2,
              )
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Expanded(
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  dateLabelText: 'Departure Date',
                  timeLabelText: 'Time',
                  onChanged: (value) {
                    departureDate = DateTime.parse(value);
                  },
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  dateLabelText: 'Arrival Date',
                  timeLabelText: 'Time',
                  onChanged: (value) {
                    arrivalDate = DateTime.parse(value);
                  },
                ),
                flex: 2,
              )
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter PNR/Ticket No',
                    prefixIcon: Icon(Icons.train),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ticket_no = value;
                  },
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter KM travelled',
                    prefixIcon: Icon(Icons.add_road),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    km = double.parse(value);
                  },
                ),
                flex: 2,
              )
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Fare',
                    prefixIcon: Icon(Icons.money),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    fare = double.parse(value);
                  },
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Additional Remarks',
                    enabledBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    additional_comments = value;
                  },
                ),
                flex: 2,
              )
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        child: Text('Local'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('GMail'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Google Drive'),
                        value: 2,
                      )
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'Where is receipt saved?',
                    ),
                    onChanged: (value) {
                      switch (value) {
                        case 0:
                          ticketAddress = 'Local';
                          break;
                        case 1:
                          ticketAddress = 'GMail';
                          break;
                        case 2:
                          ticketAddress = 'Google Drive';
                      }
                    },
                  ),
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          FilePickerResult result = await FilePicker.platform
                              .pickFiles(type: FileType.any);
                          receiptLocation = result.files.first.path;
                        } catch (err) {
                          receiptLocation = '';
                        }
                      },
                      child: Text('Add Receipt Location'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                child: Text('Send'),
                onPressed: () {
                  Map<String, dynamic> travelMap = new Map<String, dynamic>();
                  travelMap['tripid'] = widget.trip_id;
                  travelMap['dep_time'] =
                      '${departureDate.hour.toString()}:${departureDate.minute.toString()}';
                  travelMap['dep_date'] =
                      '${departureDate.year.toString()}-${departureDate.month.toString()}-${departureDate.date.toString()}';
                  travelMap['dep_station'] = departurePlace;
                  travelMap['arr_time'] =
                      '${arrivalDate.hour.toString()} : ${arrivalDate.minute.toString()}';
                  travelMap['arr_date'] =
                      '${arrivalDate.day.toString()}-${arrivalDate.month.toString()}-${arrivalDate.year.toString()}';
                  travelMap['arr_station'] = arrivalPlace;
                  travelMap['mot'] = mode;
                  travelMap['km'] = km;
                  travelMap['fare'] = fare;
                  travelMap['pnr'] = ticket_no;
                  travelMap['remarks'] = additional_comments;
                  travelMap['receipt_location'] = receiptLocation;
                  travelMap['ticket_address'] = ticketAddress;
                  insertTravelExpense(
                    travelMap['tripid'],
                    travelMap['dep_time'],
                    travelMap['dep_date'],
                    travelMap['dep_station'],
                    travelMap['arr_time'],
                    travelMap['arr_date'],
                    travelMap['arr_station'],
                    travelMap['mot'],
                    travelMap['km'],
                    travelMap['fare'],
                    travelMap['pnr'],
                    travelMap['remarks'],
                    travelMap['ticket_address'],
                    travelMap['receipt_location'],
                  );
                  widget.callback();
                  Navigator.pop(context);
                })
          ],
        ));
      });
    } else if (val == 1) {
      var type,
          details,
          amount_paid,
          receipt_details,
          receipt_address,
          receipt_location,
          dateOfExpense,
          dateString;
      var tripid = 1;
      setState(() {
        travelDetails = Form(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          child: Text('Food'),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text('Visa'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('Insurance'),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text('Stay'),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text('Registration Fee'),
                          value: 4,
                        )
                      ],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Type of Expense',
                      ),
                      onChanged: (value) {
                        switch (value) {
                          case 0:
                            type = 'Food';
                            break;
                          case 1:
                            type = 'Visa';
                            break;
                          case 2:
                            type = 'Insurance';
                            break;
                          case 3:
                            type = 'Stay';
                            break;
                          case 4:
                            type = 'Registration Fees';
                            break;
                        }
                      },
                    ),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    dateLabelText: 'Date of Expense',
                    onChanged: (value) {
                      dateOfExpense = DateTime.parse(value);
                      dateString = value;
                    },
                  ),
                  flex: 1,
                )
              ]),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Name of establishment',
                      ),
                      onChanged: (value) {
                        details = value;
                      },
                    ),
                    flex: 2,
                  ),
                  Expanded(child: SizedBox(), flex: 1),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Amount Paid',
                      ),
                      onChanged: (value) {
                        amount_paid = double.parse(amount_paid);
                        print(amount_paid);
                      },
                    ),
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Enter Receipt No/ GSTIN if any',
                      ),
                      onChanged: (value) {
                        receipt_details = value;
                      },
                    ),
                    flex: 1,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                          child: Text('Local'),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text('GMail'),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('Google Drive'),
                          value: 2,
                        ),
                      ],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Where is the receipt saved?',
                      ),
                      onChanged: (value) {
                        switch (value) {
                          case 0:
                            receipt_address = 'Local';
                            break;
                          case 1:
                            receipt_address = 'GMail';
                            break;
                          case 2:
                            receipt_address = 'Google Drive';
                        }
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            FilePickerResult result = await FilePicker.platform
                                .pickFiles(type: FileType.any);
                            receipt_location = result.paths.first;
                          },
                          child: Text('Add Receipt Location'),
                        ),
                      )),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    insertOtherExpense(
                        widget.trip_id,
                        type,
                        details,
                        amount_paid,
                        receipt_details,
                        receipt_address,
                        receipt_location,
                        dateString);
                    widget.callback();
                  },
                  child: Text('Send')),
            ],
          ),
        );
      });
    } else {
      var type,
          details,
          amount_paid,
          receipt_details,
          dateOfExpense,
          dateString,
          timeString;
      type = 'Other';
      var tripid = 1;
      setState(() {
        travelDetails = Form(
            child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'Title for Expense',
                    ),
                    onChanged: (value) {
                      details = value;
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: DateTimePicker(
                  type: DateTimePickerType.date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                  dateLabelText: 'Date of Expense',
                  onChanged: (value) {
                    dateOfExpense = DateTime.parse(value);
                    dateString = value;
                  },
                ),
                flex: 1,
              )
            ]),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      labelText: 'Amount Paid',
                    ),
                    onChanged: (value) {
                      amount_paid = double.parse(amount_paid);
                    },
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  insertPersonalExpense(
                      widget.trip_id, type, details, amount_paid, dateString);
                  Navigator.pop(context);
                },
                child: Text('Send')),
          ],
        ));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    travelDetails = Form(child: Text(''));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 16,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20),
            // height: MediaQuery.of(context).size.height,
            // width: ,

            margin: EdgeInsets.all(10.0),
//        color: Colors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  // Center is a layout widget. It takes a single child and positions it
                  // in the middle of the parent.
                  // child: Column(
                  //   // Column is also a layout widget. It takes a list of children and
                  //   // arranges them vertically. By default, it sizes itself to fit its
                  //   // children horizontally, and tries to be as tall as its parent.
                  //   //
                  //   // Invoke "debug painting" (press "p" in the console, choose the
                  //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  //   // to see the wireframe for each widget.
                  //   //
                  //   // Column has various properties to control how it sizes itself and
                  //   // how it positions its children. Here we use mainAxisAlignment to
                  //   // center the children vertically; the main axis here is the vertical
                  //   // axis because Columns are vertical (the cross axis would be
                  //   // horizontal).
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       'You have pushed the button this many times:',
                  //     ),
                  //     Text(
                  //       '$_counter',
                  //       style: Theme.of(context).textTheme.headline4,
                  //     ),
                  //   ],
                  // ),
                  child: Column(children: [
                    Form(
                      child: Column(
                        children: <Widget>[
                          DropdownButtonFormField(
                            onChanged: buildFormView,
                            decoration: InputDecoration(
                                labelText: 'Enter type of expense'),
                            items: [
                              DropdownMenuItem(child: Text('Travel'), value: 0),
                              DropdownMenuItem(
                                  child: Text('Other Expenses'), value: 1),
                              DropdownMenuItem(
                                  child: Text("Personal"), value: 2)
                            ],
                          ),
                        ],
                      ),
                    ),
                    travelDetails,
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
