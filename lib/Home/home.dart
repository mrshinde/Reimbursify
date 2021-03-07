import 'package:tripmanager/Home/additem.dart';
import 'package:tripmanager/Home/item.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/classes/user.dart';

import 'package:flutter/material.dart';
import 'package:tripmanager/classes/itemclass.dart';

final balance = 206;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final ItemClass one = ItemClass('Uber Charge - Mumbai', '19/1/2021', '-', 434);
final ItemClass two = ItemClass('Hotel Charge - Mumbai', '21/3/2021', '+', 2000);
final ItemClass three = ItemClass('Airplane Ticket - Delhi to Mumbai', '21/1/2021', '+', 4000);
final ItemClass four = ItemClass('Food Expense - KFC Mumbai', '21/1/2019', '+',1010 );
final ItemClass five = ItemClass('Personal', '19/3/2019', '+', 5000);
// final ItemClass two = ItemClass('Hotel Charge - Mumbai', '19/3/2019', '+', 2000);

final User dummy = User('Mohit Rajoria', '13-10-2000','https://scontent.fjai2-2.fna.fbcdn.net/v/t1.0-9/95362727_2741172542678274_312620172575768576_o.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc=vbhflBRs8KgAX9GREOo&_nc_ht=scontent.fjai2-2.fna&oh=4041b60cd26a103cf3d82854fb469b08&oe=5F4AC925', 34);

// List<ItemClass> temp =[];
// temp.add(one);
var temporary = [one,two,three,four,five];
// temporary.add(one);

class _HomeState extends State<Home> {

  callback(newList) {
    setState(() {
      temporary = newList;
    });
  }
  @override
  Widget build(BuildContext ct) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Trip Manager'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(dummy)),
              );
            }),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.all(10.0),
//              height: double.maxFinite,
              child: Center(
                child: Text(
                  '₹ ' + dummy.bal.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ))
        ],
      ),
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              height: 100.0,
              width: double.maxFinite,
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: ct,
                      builder: (ct) {
                        return AddItem(temporary, callback);
                      });
                },
                child: Card(
                  color: Colors.orange,
                  elevation: 25.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '+ Add Expense',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(itemCount: temporary.length,
    itemBuilder: (BuildContext ctxt, int index) {
    return new Item(temporary[index].sign,temporary[index].amount , temporary[index].note, temporary[index].date);}),
            ),
          ],
        ),
      ),
    );
  }
}
