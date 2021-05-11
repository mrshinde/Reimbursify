import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/signup.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/dashboard.dart';
import 'package:tripmanager/homepage.dart';
import 'package:tripmanager/viewreimbursements.dart';

class Profile extends StatefulWidget {
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
              MaterialPageRoute(builder: (context) => Signup()),
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
                  MaterialPageRoute(builder: (context) => Homepage()),
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
                        // Text(
                        //   "Mohit Shinde",
                        //   style: TextStyle(
                        //     fontSize: 22.0,
                        //     color: Colors.white,
                        //   ),
                        // ),
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
                                    builder: (context) => Mycards()),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forms()),
                              );
                            },
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
