import 'package:flutter/material.dart';
import 'package:tripmanager/classes/personal.dart';
import './classes/travelexpense.dart';
import 'package:file_picker/file_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import './classes/otherexpense.dart';
import './classes/personal.dart';

Widget editTravelForm(int id) {
  Travel dataMap;
  getItemById(id).then((value) {
    dataMap = value;
  });
  var arrivalPlace,
      receiptLocation,
      arrivalDate,
      departurePlace,
      departureDate,
      km,
      fare,
      ticket_no,
      additional_comments,
      mode,
      ticketAddress,
      arrivalTime,
      departureTime;
  mode = dataMap.mot;
  var mode_val, trip_id;
  trip_id = dataMap.tripid;
  if (mode == "Train")
    mode_val = 0;
  else if (mode == "Roadways")
    mode_val = 1;
  else if (mode == "Airways") mode_val = 2;
  arrivalPlace = dataMap.arr_station;
  arrivalDate = dataMap.arr_date;
  arrivalTime = dataMap.arr_time;
  arrivalDate = DateTime.parse(arrivalDate + ' ' + arrivalTime);
  departurePlace = dataMap.dep_station;
  departureDate = dataMap.dep_date;
  departureTime = dataMap.dep_time;
  departureDate = DateTime.parse(departureDate + ' ' + departureTime);
  fare = dataMap.fare;
  additional_comments = dataMap.remarks;
  km = dataMap.km;
  ticket_no = dataMap.pnr;
  var ticket_val;
  ticketAddress = dataMap.ticket_address;
  if (ticketAddress == "Local")
    ticket_val = 0;
  else if (ticketAddress == "GMail")
    ticket_val = 1;
  else if (ticketAddress == "Google Drive") ticket_val = 2;
  receiptLocation = dataMap.receipt_location;
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
                child: Column(children: [
                  Form(
                      child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              value: mode_val,
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
                            initialValue: departurePlace,
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
                            initialValue: arrivalPlace,
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
                            initialValue: departureDate.toString(),
                            type: DateTimePickerType.dateTimeSeparate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            initialDate: departureDate,
                            initialTime: TimeOfDay.fromDateTime(departureDate),
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
                            initialValue: arrivalDate.toString(),
                            type: DateTimePickerType.dateTimeSeparate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            initialDate: arrivalDate,
                            initialTime: TimeOfDay.fromDateTime(arrivalDate),
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
                            initialValue: ticket_no,
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
                            initialValue: km,
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
                            initialValue: fare,
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
                            initialValue: additional_comments,
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
                              value: ticket_val,
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
                                    FilePickerResult result = await FilePicker
                                        .platform
                                        .pickFiles(type: FileType.any);
                                    receiptLocation = result.files.first.path;
                                  } catch (err) {
                                    receiptLocation = '';
                                  }
                                },
                                child: Text('Change Receipt Location'),
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
                            Map<String, dynamic> travelMap =
                                new Map<String, dynamic>();
                            travelMap['tripid'] = trip_id;
                            travelMap['dep_time'] =
                                '${departureDate.hour.toString()}:${departureDate.minute.toString()}';
                            travelMap['dep_date'] =
                                '${departureDate.year.toString()}-${departureDate.month.toString()}-${departureDate.day.toString()}}';
                            travelMap['dep_station'] = departurePlace;
                            travelMap['arr_time'] =
                                '${arrivalDate.hour.toString()}:${arrivalDate.minute.toString()}';
                            travelMap['arr_date'] =
                                '${arrivalDate.year.toString()}-${arrivalDate.month.toString()}-${arrivalDate.day.toString()}}';
                            travelMap['arr_station'] = arrivalPlace;
                            travelMap['mot'] = mode;
                            travelMap['km'] = km;
                            travelMap['fare'] = fare;
                            travelMap['pnr'] = ticket_no;
                            travelMap['remarks'] = additional_comments;
                            travelMap['receipt_location'] = receiptLocation;
                            travelMap['ticket_address'] = ticketAddress;
                            updateTravelExpense(
                                id,
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
                                travelMap['receipt_location']);
                          })
                    ],
                  ))
                ]),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget editOtherForm(int id) {
  OtherExpense dataMap;
  getItemByIdOtherExpense(id).then(
    (value) => dataMap = value,
  );
  var type,
      details,
      amount_paid,
      dateString,
      receipt_details,
      receipt_address,
      receipt_location;
  var tripid, typeVal, receiptVal;
  tripid = dataMap.tripid;
  amount_paid = dataMap.amount_paid;
  type = dataMap.type;
  details = dataMap.details;
  receipt_details = dataMap.receipt_details;
  receipt_location = dataMap.receipt_location;
  dateString = dataMap.date;
  if (type == 'Food')
    typeVal = 0;
  else if (type == 'Visa')
    typeVal = 1;
  else if (type == 'Insurance')
    typeVal = 2;
  else if (type == 'Stay')
    typeVal = 3;
  else if (type == 'Registration Fees') typeVal = 4;
  if (receipt_address == "Local")
    receiptVal = 0;
  else if (receipt_address == "GMail")
    receiptVal = 1;
  else if (receipt_address == "Google Drive") receiptVal = 2;
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
                child: Column(children: [
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                                value: typeVal,
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
                              initialValue: dateString,
                              type: DateTimePickerType.date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              initialDate: DateTime.parse(dateString),
                              dateLabelText: 'Date of Expense',
                              onChanged: (value) {
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
                                initialValue: details,
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
                                initialValue: amount_paid,
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
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: receipt_details,
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
                                value: receiptVal,
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
                                      FilePickerResult result = await FilePicker
                                          .platform
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
                              updateOtherExpense(
                                  id,
                                  tripid,
                                  type,
                                  details,
                                  amount_paid,
                                  receipt_details,
                                  receipt_address,
                                  receipt_location,
                                  dateString);
                            },
                            child: Text('Send')),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget editPersonalForm(int id) {
  PersonalExpense dataMap;
  getItemByIdPersonalExpense(id).then((value) {
    dataMap = value;
  });
  var type, details, amount_paid, dateString;
  var tripid;
  tripid = dataMap.tripid;
  amount_paid = dataMap.amount_paid;
  type = dataMap.type;
  details = dataMap.details;
  dateString = dataMap.date;
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
                child: Column(children: [
                  Form(
                      child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: details,
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
                            initialValue: dateString,
                            type: DateTimePickerType.date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            initialDate: DateTime.parse(dateString),
                            dateLabelText: 'Date of Expense',
                            onChanged: (value) {
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
                              initialValue: amount_paid,
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
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            updatePersonalExpense(id, tripid, type, details,
                                amount_paid, dateString);
                          },
                          child: Text('Send')),
                    ],
                  )),
                ]),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
