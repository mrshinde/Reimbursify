import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tripmanager/Home/profileclass.dart';
class Editcards extends StatefulWidget {
  final User dummy;
  Editcards(this.dummy);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Editcards> {
  TextEditingController balance = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text(
              "Submit"
          ),
          backgroundColor: Colors.deepPurple,
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Edit Profile'),
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
                      colors: [Colors.purple[200], Colors.purple[200]]
                  ),
                ),
                child: Container(
                    width: double.infinity,
                    height: double.infinity,

                    child: SingleChildScrollView(
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
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  //hintText: 'What do people call you?',
                                  labelText: 'Name *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),



                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),

                                  labelText: 'Employee Code *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),


                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Department *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),

                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Designation *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Grade Pay *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Account Number *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Ifsc Code *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Google Account *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {
                                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                                },
                              )

                          ),
                        ],
                      ),
                    )

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
