import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

    return
      Scaffold(
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
          builder: (BuildContext context,
              AsyncSnapshot<Profile> snapshot) {
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
              return Column(
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
                                name,
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
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Employee Code: " + employee_code,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Department: " + department,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Designation: " + designation,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Grade Pay: " + grade_pay,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Account number: " + account_number,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "IFSC Code: " + ifsc_code,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Email: " + google_account,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.deepPurple[800],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              );
            }
          },
        ),
      );
  }
}