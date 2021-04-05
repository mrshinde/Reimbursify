import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/signup.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/TripManagerV1/lib/classes/profileclass.dart';
import 'package:tripmanager/dashboard.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup(dummy)),
            );
          },
          child: Text("Edit"),
          backgroundColor: Colors.deepPurple,
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Profile'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dashboard()),
                );
              }),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple[200], Colors.purple[200]]),
                ),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Mohit Shinde",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "IIT ROPAR",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: TextButton(
                            //color: Colors.white,
                            //padding: EdgeInsets.all(20.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => userinfo()),
                              );
                            },
                            child: Text("User Info"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20.0),
                              primary: Colors.purple,
                              backgroundColor: Colors.white,
                              onSurface: Colors.grey,
                              padding: EdgeInsets.all(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: TextButton(
                            //color: Colors.white,
                            //padding: EdgeInsets.all(20.0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mycards()),
                              );
                            },
                            child: Text("My Cards"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20.0),
                              primary: Colors.purple,
                              backgroundColor: Colors.white,
                              onSurface: Colors.grey,
                              padding: EdgeInsets.all(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: TextButton(
                            //color: Colors.white,
                            //padding: EdgeInsets.all(20.0),
                            onPressed: () {},
                            child: Text("My Documents"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20.0),
                              primary: Colors.purple,
                              backgroundColor: Colors.white,
                              onSurface: Colors.grey,
                              padding: EdgeInsets.all(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.9,
                          child: TextButton(
                            //color: Colors.white,
                            //padding: EdgeInsets.all(20.0),
                            onPressed: () {},
                            child: Text("My Reimbursements"),
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(fontSize: 20.0),
                              primary: Colors.purple,
                              backgroundColor: Colors.white,
                              onSurface: Colors.grey,
                              padding: EdgeInsets.all(20.0),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//backgroundColor: Colors.white,
//         body: Container(
//           width: double.maxFinite,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundColor: Colors.red,
//                 backgroundImage: NetworkImage(
//                     widget.dummy.dp),
//                 maxRadius: 100.0,
// //                child: Image(image: ),
//               ),
//               Card(
//                 color: Colors.red,
//                 margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
//                 child: Container(
//                   height: 50.0,
// //                  alignment: Alignment.center,
//                   width: 300.0,
// //                  padding: EdgeInsets.all(20.0),
//                   color: Colors.amber,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_box,
//                         size: 40.0,
//                       ),
//                       Divider(
//                         color: Colors.black,
//                         thickness: 5,
//                         height: 100,
//                       ),
//                       Text(
//                         widget.dummy.name,
//                         style: TextStyle(fontSize: 30.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 color: Colors.red,
//                 margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
//                 child: Container(
//                   height: 50.0,
// //                  alignment: Alignment.center,
//                   width: 300.0,
// //                  padding: EdgeInsets.all(20.0),
//                   color: Colors.amber,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       Icon(
//                         Icons.account_balance,
//                         size: 40.0,
//                       ),
//                       Container(
//                         width: 90.0,
//                       ),
//                       Text(
//                         '₹ ' + widget.dummy.bal.toString(),
//                         style: TextStyle(fontSize: 30.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.green,
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (context) {
//                         return Dialog(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(40)),
//                           child: Container(
//                             height: 100.0,
//                             margin: EdgeInsets.all(20.0),
//                             child: Column(
//                               children: <Widget>[
//                                 Center(
//                                   child: TextField(
//                                     controller: balance,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: 'New Balance'),
//                                     keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
//                                   ),
//
//                                 ),
//                                 FlatButton(
//                                   color: Colors.red,
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                                   onPressed: () {
//                                     setState(() {
//                                       widget.dummy.bal = double.parse(balance.text);
//                                     });
//                                   },
//                                   child: Text('Update'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 },
//                 child: Text(
//                   'Reset Account',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//               RaisedButton(
//                 color: Colors.green,
//                 onPressed: () {},
//                 child: Text(
//                   'Log Out',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
