import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/Home/signup.dart';

// import './classes/';'
// import 'file:///D:/AndroidStudioProjects/TripManagerV1/lib/classes/profileclass.dart';

import 'package:tripmanager/classes/profileclass.dart';

class userinfo extends StatefulWidget {
  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  Future<Profile> user_profile;
  String uid;
  String name;
  String employee_code;
  String department;
  String designation;
  String grade_pay;
  String account_number;
  String ifsc_code;
  String google_account;
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {}));
    super.initState();
    user_profile = getProfileById('1');

    // WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    // insertProfile("1", "blank", "blank", "blank", "blank", "blank", "blank", "blank", "blank");

    //user_profile=  getProfileById("1");

    //getProfileById("1").then((value) {
    //            user_profile = value;
    //          });
    //     while (true) {
    //       if (user_profile != null) break;
    //
    //     }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Signup()),
          );
        },
        label: Text("Edit"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('User Info'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: FutureBuilder<Profile>(
        future: user_profile,
        builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            name = snapshot.data.name;
            employee_code = snapshot.data.id;
            department = snapshot.data.dep;
            designation = snapshot.data.designation;
            grade_pay = snapshot.data.grade_pay;
            account_number = snapshot.data.acc_number;
            ifsc_code = snapshot.data.ifsc_code;
            google_account = snapshot.data.google;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    // height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 50, 15, 15),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.redAccent,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 68.0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.deepPurple),
                                    ),
                                    Text(
                                      designation,
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                    Text(
                                      'IIT Ropar',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ),
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
                                color: Colors.redAccent,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white60,
                            ),
                            child: Text(
                              "Employee Code: " + employee_code,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white60,
                            ),
                            child: Text(
                              "Grade Pay: " + grade_pay,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white60,
                            ),
                            child: Text(
                              "Account No: " + account_number,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white60,
                            ),
                            child: Text(
                              "IFSC: " + ifsc_code,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white60,
                            ),
                            child: Text(
                              "Google Account: " + google_account,
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
