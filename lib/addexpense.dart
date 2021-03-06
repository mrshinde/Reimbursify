import 'package:flutter/material.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/tripclass.dart';
import 'dart:async';
import 'package:date_time_picker/date_time_picker.dart';
import './classes/travelexpense.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:file_picker/file_picker.dart';
import './classes/otherexpense.dart';
import './classes/personal.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(this.trip_id, this.callback, this.isSelected);
  Function() callback;
  final int trip_id;
  List<bool> isSelected;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

int _selected_card;
Future<List<Map<String, dynamic>>> listOfCards;
List<Map<String, dynamic>> rListofCards;
List<DropdownMenuItem> cardsTile = [];
Widget cardsWidget;
BuildContext ct;
String currency;

class _MyHomePageState extends State<MyHomePage> {
  Widget travelform;
  Widget travelDetails;
  final _formKey = GlobalKey<FormState>();

  buildFormView(val) {
    cardsWidget = FutureBuilder(
        future: listOfCards,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            rListofCards = snapshot.data;
            var i = 0;
            cardsTile = [];
            while (i < snapshot.data.length) {
              cardsTile.add(DropdownMenuItem(
                value: i,
                child: (() {
                  if (snapshot.data[i]['type'] == 'Cash' ||
                      snapshot.data[i]['type'] == 'Other') {
                    return Text(snapshot.data[i]['type']);
                  } else {
                    return Text(
                      'Type: ${snapshot.data[i]['type']} ' +
                          snapshot.data[i]['number']
                              .substring(snapshot.data[i]['number'].length - 4),
                    );
                  }
                }()),
              ));
              i++;
            }
            return DropdownButtonFormField(
              validator: (value) => (value == null) ? 'Required Field' : null,
              items: cardsTile,
              onChanged: (id) {
                _selected_card = id;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                labelText: 'Mode of Payment*',
              ),
            );
          } else {
            return SizedBox(
              child: CircularProgressIndicator(),
              width: 40,
              height: 40,
            );
          }
        });

    if (val == 0) {
      var arrivalPlace,
          receiptLocation = '',
          arrivalDate,
          departurePlace,
          departureDate,
          km = 0.0,
          fare = 0.0,
          ticket_no = 'Nil',
          additional_comments = 'Nil',
          cardVal,
          mode,
          ticketAddress = 'Nil';
      // call(String s) {
      //   currency = s;
      //   setState(() {});
      // }
      TextEditingController cur = new TextEditingController();
      cur.text = 'INR';

      setState(() {
        currency = 'INR';
        travelDetails = Form(
            key: _formKey,
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
                        validator: (value) =>
                            value == null ? 'Required Field' : null,
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
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Required Field'
                          : null,
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
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Required Field'
                          : null,
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
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Required Field'
                          : null,
                      type: DateTimePickerType.dateTimeSeparate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
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
                          print(parts1);
                          if (arrivalDate != null &&
                              departureDate != null) if ((parts1[1] ==
                                      parts2[1] &&
                                  parts1[1] == '00:00:00.000') ||
                              (parts1[1] != '00:00:00.000' &&
                                  parts2[1] !=
                                      '00:00:00.000')) if (arrivalDate
                                  .compareTo(departureDate) <
                              0) return 'Arrival Date Time is before Departure';
                          return null;
                        },
                        type: DateTimePickerType.dateTimeSeparate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now(),
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
                      // validator: (value) => (value == null || value.isEmpty)
                      //     ? 'Required Field'
                      //     : null,
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
                      decoration: InputDecoration(
                        labelText: 'KM',
                        prefixIcon: Icon(Icons.add_road),
                        enabledBorder: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        km = double.tryParse(value);
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
                            context: ct,
                            showFlag: true,
                            showCurrencyName: false,
                            favorite: [currency],
                            showCurrencyCode: true,
                            onSelect: (Currency curr) {
                              currency = curr.code;
                              cur.text = currency;
                              // call(currency);
                              // setState(() {});
                            },
                          );
                          // setState(() {});
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
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      readOnly: true,
                    )),
                    // Expanded(
                    //   child: SizedBox(),
                    //   flex: 1,
                    // ),
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
                      decoration: InputDecoration(
                        labelText: 'Remarks',
                        enabledBorder: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        additional_comments = value;
                      },
                    ),
                    flex: 1,
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
                              FilePickerResult result = await FilePicker
                                  .platform
                                  .pickFiles(type: FileType.any);
                              receiptLocation = result.files.first.path;
                            } catch (err) {
                              receiptLocation = '';
                            }
                          },
                          child: Text('Add Receipt'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: cardsWidget,
                    ),
                  ],
                ),
                ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print('Hello');
                        Map<String, dynamic> travelMap =
                            new Map<String, dynamic>();
                        Map<String, dynamic> card =
                            rListofCards[_selected_card];
                        String new_comment =
                            "Payment made through card which has type: " +
                                card["type"].toString() +
                                ", account number: " +
                                card["acc_number"].toString() +
                                ", card number: " +
                                card["number"] +
                                ";" +
                                ((additional_comments == null)
                                    ? ''
                                    : additional_comments);
                        travelMap['tripid'] = widget.trip_id;
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
                        travelMap['currency'] =
                            (currency == null) ? 'INR' : currency;
                        travelMap['pnr'] = ticket_no;
                        travelMap['remarks'] = new_comment;
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
                          travelMap['currency'],
                          travelMap['pnr'],
                          travelMap['remarks'],
                          travelMap['ticket_address'],
                          travelMap['receipt_location'],
                        );
                        tripclass temp2 = await getTripById(widget.trip_id);
                        double total = temp2.total + travelMap['fare'];
                        updateAmount(widget.trip_id, total);
                        updateLastModified(widget.trip_id);
                        widget.callback();
                        Navigator.of(context).pop();
                      }
                    })
              ],
            ));
      });
    } else if (val == 1) {
      var type,
          details = 'Nil',
          amount_paid = 0.0,
          receipt_details = 'Nil',
          remarks = 'Nil',
          receipt_address = 'Nil',
          receipt_location = '',
          dateOfExpense,
          dateString = 'Nil';
      currency = 'INR';
      TextEditingController cur = new TextEditingController();
      cur.text = 'INR';
      // cardsWidget = FutureBuilder(
      //   future: listOfCards,
      //   builder: (BuildContext context,
      //       AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.hasData) {
      //       rListofCards = snapshot.data;
      //       var i = 0;
      //       cardsTile = [];
      //       while (i < snapshot.data.length) {
      //         cardsTile.add(DropdownMenuItem(
      //           value: i,
      //           child: Text(snapshot.data[i]['number'] +
      //               'Type: ${snapshot.data[i]['type']}, AC no : ${snapshot.data[i]['acc_number']}'),
      //         ));
      //         i++;
      //       }
      //       return DropdownButtonFormField(
      //         validator: (value) => (value == null) ? 'Required Field' : null,
      //         items: cardsTile,
      //         onChanged: (id) {
      //           _selected_card = id;
      //         },
      //         decoration: InputDecoration(
      //           enabledBorder: OutlineInputBorder(),
      //           labelText: 'Select Card',
      //         ),
      //       );
      //     } else {
      //       return SizedBox(
      //         child: CircularProgressIndicator(),
      //         width: 40,
      //         height: 40,
      //       );
      //     }
      //   });
      setState(() {
        travelDetails = Form(
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
                      validator: (value) =>
                          (value == null) ? 'Required Field' : null,
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
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Required Field'
                        : null,
                    type: DateTimePickerType.date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    dateLabelText: 'Date of Expense*',
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
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Required Field'
                          : null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Vendor/Website/Hotel*',
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Select Currency'),
                      onPressed: () {
                        showCurrencyPicker(
                          context: ct,
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
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                    ),
                    readOnly: true,
                  )),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          (value == null || (double.tryParse(value) == null))
                              ? 'Required/Incorrect  Field'
                              : null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Amount Paid*',
                      ),
                      onChanged: (value) {
                        amount_paid = double.tryParse(value);
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
                      // validator: (value) => (value == null || value.isEmpty)
                      //     ? 'Required Field'
                      //     : null,
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
                      // validator: (value) =>
                      //     (value == null) ? 'Required Field' : null,
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
                            FilePickerResult result = await FilePicker.platform
                                .pickFiles(type: FileType.any);
                            receipt_location = result.paths.first;
                          },
                          child: Text('Add Receipt'),
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
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: 'Remarks',
                      ),
                      onChanged: (value) {
                        remarks = value;
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
                    child: cardsWidget,
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Map<String, dynamic> card = rListofCards[_selected_card];
                      if (remarks == null) remarks = '';
                      String new_comment =
                          "Payment made through card which has type: " +
                              card["type"].toString() +
                              ", account number: " +
                              card["acc_number"].toString() +
                              ", card number: " +
                              card["number"] +
                              ";" +
                              ((receipt_details == null)
                                  ? ''
                                  : receipt_details) +
                              ";" +
                              remarks;
                      insertOtherExpense(
                          widget.trip_id,
                          type,
                          details,
                          amount_paid,
                          currency,
                          new_comment,
                          receipt_address,
                          receipt_location,
                          dateString);
                      tripclass temp2 = await getTripById(widget.trip_id);
                      double total = temp2.total + amount_paid;
                      updateAmount(widget.trip_id, total);
                      updateLastModified(widget.trip_id);
                      widget.callback();

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit')),
            ],
          ),
        );
      });
    } else {
      var type,
          details = 'Nil',
          amount_paid = 0.0,
          receipt_details = 'Nil',
          dateOfExpense,
          dateString,
          timeString;
      TextEditingController cur = new TextEditingController();
      cur.text = 'INR';
      type = 'Other';
      currency = 'INR';
      // var tripid = 1;
      setState(() {
        travelDetails = Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        // validator: (value) => (value == null || value.isEmpty)
                        //     ? 'Required Field'
                        //     : null,
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
                      validator: (value) => (value == null || value.isEmpty)
                          ? 'Required Field'
                          : null,
                      type: DateTimePickerType.date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                      dateLabelText: 'Date of Expense*',
                      onChanged: (value) {
                        dateOfExpense = DateTime.parse(value);
                        dateString = value;
                      },
                    ),
                    flex: 1,
                  )
                ]),
                SizedBox(height: 10),
                Container(
                  child: DropdownButtonFormField(
                    validator: (value) =>
                        (value == null) ? 'Required Field' : null,
                    items: [
                      DropdownMenuItem(
                        child: Text('Food'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('Travel'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Visiting Fee'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Tourist Ticket'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('Other'),
                        value: 4,
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
                          type = 'Travel';
                          break;
                        case 2:
                          type = 'Visiting Fee';
                          break;
                        case 3:
                          type = 'Tourist Ticket';
                          break;
                        case 4:
                          type = 'Other';
                          break;
                      }
                    },
                  ),
                  // flex: 1,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Select Currency'),
                        onPressed: () {
                          showCurrencyPicker(
                            context: ct,
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
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                      ),
                      readOnly: true,
                    )),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            (value == null || (double.tryParse(value) == null))
                                ? 'Required Field'
                                : null,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(),
                          labelText: 'Amount Paid*',
                        ),
                        onChanged: (value) {
                          amount_paid = double.tryParse(value);
                        },
                      ),
                      flex: 2,
                    ),
                    // Expanded(
                    //   child: SizedBox(),
                    //   flex: 1,
                    // ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (details == '') details = 'Nil';
                      if (_formKey.currentState.validate()) {
                        insertPersonalExpense(widget.trip_id, type, details,
                            amount_paid, currency, dateString);
                        updateLastModified(widget.trip_id);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Submit')),
                SizedBox(height: 10),
                Text(
                  "*Personal Expenses will not be added to the Final Total",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    listOfCards = getCards();
    travelDetails = Form(child: Text(''));
  }

  @override
  Widget build(BuildContext context) {
    ct = context;
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
                  child: (() {
                    if (this.widget.isSelected[0] == true) {
                      return Column(children: [
                        Form(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                                child: DropdownButtonFormField(
                                  onChanged: buildFormView,
                                  decoration: InputDecoration(
                                      labelText: 'Enter type of expense'),
                                  items: [
                                    DropdownMenuItem(
                                        child: Text('Travel'), value: 0),
                                    DropdownMenuItem(
                                        child: Text('Other Expenses'),
                                        value: 1),
                                    DropdownMenuItem(
                                        child: Text("Personal"), value: 2)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        travelDetails,
                      ]);
                    } else if (this.widget.isSelected[1] == true) {
                      buildFormView(0);
                      return travelDetails;
                    } else if (this.widget.isSelected[2] == true) {
                      buildFormView(1);
                      return travelDetails;
                    } else {
                      buildFormView(2);
                      return travelDetails;
                    }
                  }()),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
