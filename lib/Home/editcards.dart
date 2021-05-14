// import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/Home/profile.dart' as p;

class Editcards extends StatefulWidget {
  //final User dummy;
  Editcards();

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Editcards> {
  //String Uid="1";
  //TextEditingController Uid = TextEditingController();
  TextEditingController Type = TextEditingController();
  TextEditingController Number = TextEditingController();
  TextEditingController Acc_number = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Add Cards'),
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
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //CircleAvatar(
                            //
                            //                           radius: 50.0,
                            //                         ),
                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  validator : (value) => (value == null || value.isEmpty) ? 'Required Field' : null,
                                  controller: Type,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    //hintText: 'What do people call you?',
                                    labelText: 'Card Type *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                )),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  controller: Number,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Card Number *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                  validator: (value){
                                    return value.length < 10 ? 'Card Number Should be Greater than 12 Character' : null;
                                  },
                                )),

                            FractionallySizedBox(
                                widthFactor: 0.9,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: Acc_number,
                                  validator : (value) => (value == null || value.isEmpty) ? 'Required Field' : null,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.person),
                                    labelText: 'Account Number *',
                                  ),
                                  onSaved: (String value) {
                                    // This optional block of code can be used to run
                                    // code when the user saves the form.
                                  },
                                )),
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              setState(() {
                //deleteProfile(Uid);
                if(_formKey.currentState.validate()) {
                  insertCard(Type.text, Number.text, Acc_number.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => p.Profile()));
                }
              });
              // insertProfile(Uid, Name.text, Employee_code.text, Department.text, Designation.text, Grade_pay.text, Account_number.text, Ifsc_code.text, Google_account.text);
            }),
      ),
    );
  }
}
