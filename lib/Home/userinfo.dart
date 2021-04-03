import 'package:flutter/material.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/Home/profileclass.dart';

class userinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> user_profile;
    getProfileById("1").then((value) {
      user_profile = value;
    });
    while (true) {
      if (user_profile != null) break;
    }

    String name = user_profile["name"];
    String employee_code = user_profile["id"];
    String department = user_profile["dep"];
    String designation = user_profile["name"];
    String grade_pay = user_profile["grade_pay"];
    String account_number = user_profile["acc_number"];
    String ifsc_code = user_profile["ifsc_code"];
    String google_account = user_profile["google"];

    return MaterialApp(
      home: Scaffold(
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
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
      ),
    );
  }
}
