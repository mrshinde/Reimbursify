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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => userinfo()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                            child: Container(
                                height: 60,
                                margin: EdgeInsets.only(bottom: 8),
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  // boxShadow: ,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.purple,
                                ),
                                child: Center(
                                    child: Text(
                                  ' User Info',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mycards()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 8),
                            child: Container(
                                height: 60,
                                // margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.purple,
                                ),
                                child: Center(
                                    child: Text(
                                  ' My Cards',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Forms()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                                height: 60,
                                // margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.purple,
                                ),
                                child: Center(
                                    child: Text(
                                  ' My Reimbursements',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ))),
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
