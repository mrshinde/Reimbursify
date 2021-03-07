import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final User dummy;
  Profile(this.dummy);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController balance = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    widget.dummy.dp),
                maxRadius: 100.0,
//                child: Image(image: ),
              ),
              Card(
                color: Colors.red,
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                child: Container(
                  height: 50.0,
//                  alignment: Alignment.center,
                  width: 300.0,
//                  padding: EdgeInsets.all(20.0),
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        size: 40.0,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 5,
                        height: 100,
                      ),
                      Text(
                        widget.dummy.name,
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.red,
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: Container(
                  height: 50.0,
//                  alignment: Alignment.center,
                  width: 300.0,
//                  padding: EdgeInsets.all(20.0),
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance,
                        size: 40.0,
                      ),
                      Container(
                        width: 90.0,
                      ),
                      Text(
                        '₹ ' + widget.dummy.bal.toString(),
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Container(
                            height: 100.0,
                            margin: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: TextField(
                                    controller: balance,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'New Balance'),
                                    keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
                                  ),

                                ),
                                FlatButton(
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                                  onPressed: () {
                                    setState(() {
                                      widget.dummy.bal = double.parse(balance.text);
                                    });
                                  },
                                  child: Text('Update'),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text(
                  'Reset Account',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
