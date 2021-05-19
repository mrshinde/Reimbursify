// import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/profileclass.dart' as profclass;
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripmanager/classes/profileclass.dart';

import '../homepage.dart';

// class FirstSignup extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<FirstSignup> {
//   String Uid = "1";
//   //TextEditingController Uid = TextEditingController();
//   TextEditingController Name = TextEditingController();
//   TextEditingController Employee_code = TextEditingController();
//   TextEditingController Department = TextEditingController();
//   TextEditingController Designation = TextEditingController();
//   TextEditingController Grade_pay = TextEditingController();
//   TextEditingController Account_number = TextEditingController();
//   TextEditingController Ifsc_code = TextEditingController();
//   TextEditingController Google_account = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurple,
//           title: Text('Edit Profile'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Colors.purple[200], Colors.purple[200]]),
//                 ),
//                 child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           //CircleAvatar(
//                           //
//                           //                           radius: 50.0,
//                           //                         ),

//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Name,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   //hintText: 'What do people call you?',
//                                   labelText: 'Name *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),

//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Employee_code,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Employee Code *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),

//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Department,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Department *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),

//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Designation,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Designation *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),
//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Grade_pay,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Grade Pay *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),
//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Account_number,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Account Number *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),
//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Ifsc_code,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Ifsc Code *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),
//                           FractionallySizedBox(
//                               widthFactor: 0.9,
//                               child: TextFormField(
//                                 controller: Google_account,
//                                 decoration: const InputDecoration(
//                                   icon: Icon(Icons.person),
//                                   labelText: 'Google Account *',
//                                 ),
//                                 onSaved: (String value) {
//                                   // This optional block of code can be used to run
//                                   // code when the user saves the form.
//                                 },
//                                 validator: (String value) {},
//                               )),
//                         ],
//                       ),
//                     )),
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.check),
//             onPressed: () {
//               setState(() {
//                 //deleteProfile(Uid);
//                 updateProfile(
//                     Name.text,
//                     Employee_code.text,
//                     Department.text,
//                     Designation.text,
//                     Grade_pay.text,
//                     Account_number.text,
//                     Ifsc_code.text,
//                     Google_account.text,
//                     Uid);
//               });
//               // insertProfile(Uid, Name.text, Employee_code.text, Department.text, Designation.text, Grade_pay.text, Account_number.text, Ifsc_code.text, Google_account.text);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Homepage()),
//               );
//               //Navigator.pop(context, "Your profile has been saved.");
//             }),
//       ),
//     );
//   }
// }

String validatePassword(String value) {
  if (value == null || value.isEmpty) {
    return "Mandatory Field!";
  }
  return null;
}

class LogInInfo extends StatefulWidget {
  @override
  _LogInInfoState createState() => _LogInInfoState();
}

class _LogInInfoState extends State<LogInInfo> {
  final String Uid = "1";

  TextEditingController Name = TextEditingController();

  TextEditingController Employee_code = TextEditingController();

  TextEditingController Department = TextEditingController();

  TextEditingController Designation = TextEditingController();

  TextEditingController Grade_pay = TextEditingController();

  String Pay_scale = '';

  TextEditingController Account_number = TextEditingController();

  TextEditingController Ifsc_code = TextEditingController();

  TextEditingController Google_account = TextEditingController();

  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 60.0,
                    ),
                    child: Text(
                      'Tripiva',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.red,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: Offset(10, 10))
                          ]),
                    ),
                  ),
                  color: Colors.deepPurple,
                  height: 500.0,
                ),
              ],
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 45.0,
                    ),
                  ],
                  color: Colors.blue[200],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(10.0, 240.0, 10.0, 100.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Name *',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Name,
                            decoration: InputDecoration(
                              errorText: _validate
                                  ? validatePassword(Name.text)
                                  : null,
                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: FlatButton(
                          onPressed: () async {
                            setState(() {
                              _validate = true;
                            });
                            if (validatePassword(Name.text) == null) {
                              updateProfile(
                                  Name.text,
                                  Employee_code.text,
                                  Department.text,
                                  Designation.text,
                                  Grade_pay.text,
                                  Pay_scale,
                                  Account_number.text,
                                  Ifsc_code.text,
                                  Google_account.text,
                                  Uid);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setBool("loggedIn", true);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Homepage()));
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(500.0),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  ' Next ',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.black),
                                ),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          '(Optional) You may also add the below information. This is used to generate the reimbursement form',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Employee Code',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Employee_code,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Employee_code.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Department',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Department,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Department.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Designation',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Designation,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Designation.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Basic Pay',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Grade_pay,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Grade_pay.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Pay Level',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          DropdownButtonFormField(
                            onChanged: (value){
                              Pay_scale = value;
                            },
                            items: List<String>.generate(18, (i) => (i + 1).toString())
                                  .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                    }).toList(),
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Grade_pay.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Account Number',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Account_number,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Account_number.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'IFSC Code',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Ifsc_code,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Ifsc_code.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Email Account',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: Google_account,
                            decoration: InputDecoration(
                              // errorText: _validate
                              //     ? validatePassword(Google_account.text)
                              //     : null,

                              filled: true,
                              hoverColor: Colors.white,
                              fillColor: Colors.white30,
                              //disabledBorder:OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: FlatButton(
                          onPressed: () async {
                            setState(() {
                              _validate = true;
                            });
                            if (validatePassword(Name.text) == null) {
                              updateProfile(
                                  Name.text,
                                  Employee_code.text,
                                  Department.text,
                                  Designation.text,
                                  Grade_pay.text,
                                  Pay_scale,
                                  Account_number.text,
                                  Ifsc_code.text,
                                  Google_account.text,
                                  Uid);
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setBool("loggedIn", true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Homepage()));
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(500.0),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  ' Next ',
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.black),
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
