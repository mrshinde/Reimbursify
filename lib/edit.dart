// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tripmanager/classes/personal.dart';
import 'package:tripmanager/classes/tripclass.dart';
import './classes/travelexpense.dart';
import 'package:file_picker/file_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import './classes/otherexpense.dart';
import './classes/personal.dart';

Widget editTravelForm(
    Function() callback, int id, BuildContext context, Travel travelinstance) {
  Travel dataMap = travelinstance;
  final _formKey = GlobalKey<FormState>();
  print(dataMap.toMap());
  // getItemById(id).then((value) {
  // dataMap = value;
  // });
  var arrivalPlace,
      receiptLocation,
      arrivalDate,
      departurePlace,
      departureDate,
      km,
      fare,
      ticket_no,
      cardInfo,
      additional_comments,
      currency,
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
  else if (mode == "Airways")
    mode_val = 2;
  else if (mode == "Taxi")
    mode_val = 3;
  else if (mode == "Bus")
    mode_val = 4;
  else if (mode == "Own Car")
    mode_val = 5;
  else if (mode == "Auto")
    mode_val = 6;
  else if (mode == "Steamer")
    mode_val = 7;
  else if (mode == "Metro")
    mode_val = 8;
  else if (mode == "Other") mode_val = 9;
  // else if (mode == "Airways") mode_val = 2;
  arrivalPlace = dataMap.arr_station;
  arrivalDate = dataMap.arr_date;
  arrivalTime = dataMap.arr_time;
  arrivalDate = DateTime.tryParse(arrivalDate + ' ' + arrivalTime);
  departurePlace = dataMap.dep_station;
  departureDate = dataMap.dep_date;
  departureTime = dataMap.dep_time;
  departureDate = DateTime.parse(departureDate + ' ' + departureTime);
  fare = dataMap.fare;
  double ex = dataMap.fare;
  additional_comments = dataMap.remarks;
  if (additional_comments != null) {
    cardInfo = additional_comments.split(';').first;
    additional_comments = additional_comments.split(';').last;
  }
  km = dataMap.km;
  ticket_no = dataMap.pnr;
  var ticket_val;
  ticketAddress = dataMap.ticket_address;
  currency = (dataMap.currency == null) ? 'INR' : dataMap.currency;
  print(currency);
  TextEditingController cur = new TextEditingController();
  cur.text = currency;
  if (ticketAddress == "Local")
    ticket_val = 0;
  else if (ticketAddress == "EMail")
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
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  validator: (value) =>
                                      value == null ? 'Required Field' : null,
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
                                    DropdownMenuItem(
                                      child: Text('Taxi'),
                                      value: 3,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Bus'),
                                      value: 4,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Own Car'),
                                      value: 5,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Auto'),
                                      value: 6,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Steamer'),
                                      value: 7,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Metro'),
                                      value: 8,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Other'),
                                      value: 9,
                                    ),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: 'Enter Mode of Travel*',
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
                                        break;
                                      case 3:
                                        mode = 'Taxi';
                                        break;
                                      case 4:
                                        mode = 'Bus';
                                        break;
                                      case 5:
                                        mode = 'Own Car';
                                        break;
                                      case 6:
                                        mode = 'Auto';
                                        break;
                                      case 7:
                                        mode = 'Steamer';
                                        break;
                                      case 8:
                                        mode = 'Metro';
                                        break;
                                      case 9:
                                        mode = 'Other';
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
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? 'Required Field'
                                        : null,
                                initialValue: departurePlace,
                                decoration: InputDecoration(
                                  labelText: 'From*',
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
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? 'Required Field'
                                        : null,
                                initialValue: arrivalPlace,
                                decoration: InputDecoration(
                                  labelText: 'To*',
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
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? 'Required Field'
                                        : null,
                                initialValue: departureDate.toString(),
                                type: DateTimePickerType.dateTimeSeparate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                initialDate: departureDate,
                                initialTime:
                                    TimeOfDay.fromDateTime(departureDate),
                                dateLabelText: 'Departure Date*',
                                timeLabelText: 'Time',
                                onChanged: (value) {
                                  departureDate = DateTime.parse(value);
                                },
                              ),
                              flex: 1,
                            ),
                          ]),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: DateTimePicker(
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return null;
                                    List<String> parts1 =
                                        departureDate.toString().split(" ");
                                    List<String> parts2 =
                                        arrivalDate.toString().split(" ");
                                    if (arrivalDate != null &&
                                        departureDate != null) if ((parts1[1] ==
                                                parts2[1] &&
                                            parts1[1] == '00:00:00.000') ||
                                        (parts1[1] != '00:00:00.000' &&
                                            parts2[1] !=
                                                '00:00:00.000')) if (arrivalDate
                                            .compareTo(departureDate) <
                                        0)
                                      return 'Arrival Date Time is before Departure';
                                    return null;
                                  },
                                  initialValue: (arrivalDate == null) ? null :arrivalDate.toString(),
                                  type: DateTimePickerType.dateTimeSeparate,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  initialDate: (arrivalDate == null) ? DateTime.now() : arrivalDate,
                                  initialTime:
                                      (arrivalDate == null) ? null : TimeOfDay.fromDateTime(arrivalDate),
                                  dateLabelText: 'Destination Arrival Date',
                                  timeLabelText: 'Time',
                                  onChanged: (value) {
                                    arrivalDate = DateTime.parse(value);
                                  },
                                ),
                                flex: 1,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                // validator: (value) =>
                                //     (value == null || value.isEmpty)
                                //         ? 'Required Field'
                                //         : null,
                                initialValue: ticket_no,
                                decoration: InputDecoration(
                                  labelText: 'PNR/Ticket No',
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
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return null;
                                  else if (double.tryParse(value) == null)
                                    return 'Not a valid number';
                                  else
                                    return null;
                                },
                                initialValue: km.toString(),
                                decoration: InputDecoration(
                                  labelText: 'KM travelled',
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
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: Text('Select Currency'),
                                  onPressed: () {
                                    showCurrencyPicker(
                                      context: context,
                                      showFlag: true,
                                      showCurrencyName: false,
                                      favorite: [currency],
                                      showCurrencyCode: true,
                                      onSelect: (Currency curr) {
                                        currency = curr.code;
                                        cur.text = currency;
                                      },
                                    );
                                  },
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: SizedBox(),
                                flex: 1,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: cur,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              )),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Required Field';
                                    else if (double.tryParse(value) == null)
                                      return 'Not a valid number';
                                    else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Fare*',
                                    prefixIcon: Icon(Icons.money),
                                    enabledBorder: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    fare = double.tryParse(value);
                                  },
                                  initialValue: fare.toString(),
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                initialValue: additional_comments,
                                decoration: InputDecoration(
                                  labelText: 'Remarks',
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
                                  // validator: (value) =>
                                  //     value == null ? 'Required Value' : null,
                                  value: ticket_val,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Local'),
                                      value: 0,
                                    ),
                                    DropdownMenuItem(
                                      child: Text('EMail'),
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
                                        ticketAddress = 'EMail';
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
                                        FilePickerResult result =
                                            await FilePicker.platform
                                                .pickFiles(type: FileType.any);
                                        receiptLocation =
                                            result.files.first.path;
                                      } catch (err) {
                                        receiptLocation = '';
                                      }
                                    },
                                    child: Text('Change Receipt'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              child: Text('Submit'),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  if (ticket_no == '') {
                                    ticket_no = 'Nil';
                                  }
                                  if (additional_comments == '') {
                                    additional_comments = 'Nil';
                                  }
                                  Map<String, dynamic> travelMap =
                                      new Map<String, dynamic>();
                                  travelMap['tripid'] = trip_id;
                                  var temp;
                                  if(departureDate != null){
                                    temp = departureDate.toString().split(" ");

                                    travelMap['dep_time'] =
                                        temp[1].split(":")[0] + ":" + temp[1].split(":")[1];
                                    travelMap['dep_date'] = temp[0];
                                  }
                                  else{
                                    travelMap['arr_date'] = '';
                                    travelMap['arr_time'] = '';
                                  }
                                  travelMap['dep_station'] = departurePlace;
                                  if(arrivalDate != null){
                                    temp = arrivalDate.toString().split(" ");
                                    travelMap['arr_time'] =
                                        temp[1].split(":")[0] + ":" + temp[1].split(":")[1];
                                    travelMap['arr_date'] = temp[0];
                                  }
                                  else{
                                    travelMap['arr_date'] = '';
                                    travelMap['arr_time'] = '';
                                  }
                                  travelMap['arr_station'] = arrivalPlace;
                                  travelMap['mot'] = mode;
                                  travelMap['km'] = km;
                                  travelMap['fare'] = fare;
                                  travelMap['pnr'] = ticket_no;
                                  if (cardInfo == null)
                                    travelMap['remarks'] = additional_comments;
                                  else
                                    travelMap['remarks'] =
                                        cardInfo + ';' + additional_comments;
                                  travelMap['receipt_location'] =
                                      receiptLocation;
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
                                      currency,
                                      travelMap['pnr'],
                                      travelMap['remarks'],
                                      travelMap['ticket_address'],
                                      travelMap['receipt_location']);
                                  tripclass temp2 = await getTripById(trip_id);
                                  double total =
                                      temp2.total + travelMap['fare'] - ex;
                                  print(total);
                                  updateAmount(trip_id, total);
                                  updateLastModified(trip_id);
                                  callback();
                                  Navigator.pop(context);
                                }
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

Widget editOtherForm(
    Function() callback, int id, BuildContext context, OtherExpense expense) {
  print("Navneet's Wish");
  OtherExpense dataMap = expense;
  final _formKey = GlobalKey<FormState>();
  // getItemByIdOtherExpense(id).then(
  // (value) => dataMap = value,
  // );
  var type,
      details,
      amount_paid,
      dateString,
      receipt_details,
      currency,
      cardInfo,
      additional_comments,
      receipt_address,
      receipt_location;
  var tripid, typeVal, receiptVal;
  tripid = dataMap.tripid;
  currency = (dataMap.currency == null) ? 'INR' : dataMap.currency;
  amount_paid = dataMap.amount_paid.toString();
  double ex = dataMap.amount_paid;
  type = dataMap.type;
  details = dataMap.details;
  receipt_details = dataMap.receipt_details;
  TextEditingController cur = new TextEditingController();
  cur.text = currency;
  if (receipt_details.split(';').length == 3) {
    cardInfo = receipt_details.split(';')[0];
    additional_comments = receipt_details.split(';')[2];
    receipt_details = receipt_details.split(';')[1];
  } else {
    additional_comments = receipt_details.split(';').last;
    receipt_details = receipt_details.split(';').first;
  }
  receipt_address = dataMap.receipt_location;
  dateString = dataMap.date;
  if (type == 'Food')
    typeVal = 0;
  else if (type == 'Visa')
    typeVal = 1;
  else if (type == 'Insurance')
    typeVal = 2;
  else if (type == 'Stay')
    typeVal = 3;
  else if (type == 'Registration Fees')
    typeVal = 4;
  else
    typeVal = 5;
  if (receipt_address == "Local")
    receiptVal = 0;
  else if (receipt_address == "EMail")
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
                    key: _formKey,
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
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Miscellaneous'),
                                    value: 5,
                                  )
                                ],
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  labelText: 'Type of Expense*',
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
                                    case 5:
                                      type = "Miscellaneous";
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
                              validator: (value) =>
                                  (value == null || value.isEmpty)
                                      ? 'Required Field'
                                      : null,
                              initialValue: dateString,
                              type: DateTimePickerType.date,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              initialDate: DateTime.parse(dateString),
                              dateLabelText: 'Date of Expense*',
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
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? 'Required Field'
                                        : null,
                                initialValue: details,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  labelText: 'Vendor/Website/Hotel*',
                                ),
                                onChanged: (value) {
                                  details = value;
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
                              child: ElevatedButton(
                                child: Text('Select Currency'),
                                onPressed: () {
                                  showCurrencyPicker(
                                    context: context,
                                    showFlag: true,
                                    showCurrencyName: false,
                                    favorite: [currency],
                                    showCurrencyCode: true,
                                    onSelect: (Currency curr) {
                                      currency = curr.code;
                                      cur.text = currency;
                                    },
                                  );
                                },
                              ),
                              flex: 2,
                            ),
                            Expanded(child: SizedBox(), flex: 1),
                            Expanded(
                                child: TextField(
                              controller: cur,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                ),
                              ),
                              readOnly: true,
                            )),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) => (value == null ||
                                        (double.tryParse(value) == null))
                                    ? 'Required Field'
                                    : null,
                                initialValue: amount_paid,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  labelText: 'Amount Paid*',
                                ),
                                onChanged: (value) {
                                  amount_paid = value;
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
                                // validator: (value) =>
                                //     (value == null || value.isEmpty)
                                //         ? 'Required Field'
                                //         : null,
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
                                    child: Text('EMail'),
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
                                      receipt_address = 'EMail';
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
                                    child: Text('Change Receipt'),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: additional_comments,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  labelText: 'Remarks',
                                ),
                                onChanged: (value) {
                                  additional_comments = value;
                                },
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              if (additional_comments == '') {
                                additional_comments = 'Nil';
                              }
                              if (receipt_details == '') {
                                receipt_details = 'Nil';
                              }
                              double amount = double.parse(amount_paid);
                              if (cardInfo == null)
                                receipt_details =
                                    receipt_details + ';' + additional_comments;
                              else
                                receipt_details = cardInfo +
                                    ';' +
                                    receipt_details +
                                    ';' +
                                    additional_comments;
                              if (receipt_address == '') {
                                receipt_address = 'Nil';
                              }
                              // if (receipt_address.isEmpty() == true) {
                              //   receipt_address = 'Nil';
                              // }
                              updateOtherExpense(
                                  id,
                                  tripid,
                                  type,
                                  details,
                                  amount,
                                  currency,
                                  receipt_details,
                                  receipt_address,
                                  receipt_location,
                                  dateString);
                              tripclass temp2 = await getTripById(tripid);
                              double total = temp2.total + amount - ex;
                              print(total);
                              updateAmount(tripid, total);
                              updateLastModified(tripid);
                              callback();
                              Navigator.of(context).pop();
                            }
                          },
                        ),
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

Widget editPersonalForm(Function() callback, int id, BuildContext context,
    PersonalExpense expense) {
  PersonalExpense dataMap = expense;
  final _formKey = GlobalKey<FormState>();
  // getItemByIdPersonalExpense(id).then((value) {
  //   dataMap = value;
  // });
  var type, details, amount_paid, dateString, currency;
  var tripid;
  tripid = dataMap.tripid;
  amount_paid = dataMap.amount_paid.toString();
  type = dataMap.type;
  details = dataMap.details;
  dateString = dataMap.date;
  TextEditingController cur = new TextEditingController();
  currency = (dataMap.currency == null) ? 'INR' : dataMap.currency;
  cur.text = currency;

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
                      key: _formKey,
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
                                    labelText: 'Remarks',
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
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? 'Required Field'
                                        : null,
                                initialValue: dateString,
                                type: DateTimePickerType.date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                initialDate: DateTime.parse(dateString),
                                dateLabelText: 'Date of Expense*',
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
                                child: ElevatedButton(
                                  child: Text('Select Currency'),
                                  onPressed: () {
                                    showCurrencyPicker(
                                      context: context,
                                      showFlag: true,
                                      showCurrencyName: false,
                                      favorite: [currency],
                                      showCurrencyCode: true,
                                      onSelect: (Currency curr) {
                                        currency = curr.code;
                                        cur.text = currency;
                                      },
                                    );
                                  },
                                ),
                                flex: 2,
                              ),
                              Expanded(child: SizedBox(), flex: 1),
                              Expanded(
                                  child: TextField(
                                controller: cur,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                ),
                                readOnly: true,
                              )),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) => (value == null ||
                                          (double.tryParse(value) == null))
                                      ? 'Required Field'
                                      : null,
                                  initialValue: amount_paid,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    labelText: 'Amount Paid*',
                                  ),
                                  onChanged: (value) {
                                    amount_paid = value;
                                  },
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                if (details == '') details = 'Nil';
                                if (_formKey.currentState.validate()) {
                                  updatePersonalExpense(
                                      id,
                                      tripid,
                                      type,
                                      details,
                                      double.parse(amount_paid),
                                      currency,
                                      dateString);
                                  updateLastModified(tripid);
                                  callback();

                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Submit')),
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
