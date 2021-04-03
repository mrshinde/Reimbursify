import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/itemclass.dart';

enum SingingCharacter { Card, Cash }

class AddItem extends StatefulWidget {
  final List<ItemClass> temp;
//  final BuildContext ct;
  Function(List<ItemClass>) callback;
  AddItem(this.temp, this.callback);
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  SingingCharacter _character = SingingCharacter.Card;
  String flow = "Cash";
  String typeofexpense = "Travel";
  TextEditingController amount = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController note = TextEditingController();
  ItemClass st = ItemClass(
      title: 'Title_2', sdate: '21/3/2021', edate: '19/1/2021', amount: 2000);
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: <Widget>[
                Container(
                  child: Center(
                      child: Text(
                    'Details',
                    style: TextStyle(fontSize: 20),
                  )),
                  color: Colors.black12,
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text('Title'),
                  ),
                ),
                Center(
                  child: TextField(
                    // controller: note,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What is it about?'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: DropdownButton(
                          value: typeofexpense,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 25,
                          elevation: 16,
                          focusColor: Colors.red,
                          onChanged: (String newValue) {
                            setState(() {
                              typeofexpense = newValue;
                            });
                          },
                          items: <String>[
                            'Travel',
                            'Food',
                            'Accomodation',
                            'Personal',
                            'Other'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                      // DropdownButton(
                      //   value: flow,
                      //   icon: Icon(Icons.arrow_drop_down),
                      //   iconSize: 25,
                      //   elevation: 16,
                      //   focusColor: Colors.red,
                      //   onChanged: (String newValue) {
                      //     setState(() {
                      //       flow = newValue;
                      //     });
                      //   },
                      //   items: <String>['Cash', 'Card']
                      //       .map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                      // SizedBox(
                      //   height: 20.0,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () => _selectDate(context),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      controller: note,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Additional Information'),
                    ),
                  ),
                ),
                // Center(
                //   child: TextField(
                //     controller: date,
                //     decoration: InputDecoration(
                //         border: InputBorder.none, hintText: 'Enter date'),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: true),
                      controller: amount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Amount'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    // padding: EdgeInsets.only(top: 20),
                    child: Center(
                        child: Text(
                      'Mode of Payment',
                      style: TextStyle(fontSize: 20),
                    )),
                    color: Colors.black12,
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                  ),
                ),
                // Text('Mode Of Payment'),
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Card'),
                        leading: Radio(
                          value: SingingCharacter.Card,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Cash'),
                        leading: Radio(
                          value: SingingCharacter.Cash,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.camera_alt_rounded,
                  size: 100,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      st.title = note.text;
                      st.sdate = '-';
                      st.edate = "${selectedDate.toLocal()}".split(' ')[0];
                      st.amount = double.parse(amount.text);
                      widget.temp.add(st);
                      widget.callback(widget.temp);
                    });
                    print(st);
                    print(widget.temp);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 30),
                  ),
                  color: Colors.green,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
