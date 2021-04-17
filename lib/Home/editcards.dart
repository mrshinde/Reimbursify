

// import 'package:tripmanager/Home/home.dart';
import 'package:tripmanager/Home/mycards.dart';
import 'package:tripmanager/Home/userinfo.dart';
import 'package:tripmanager/classes/profileclass.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
                                validator: (String value) {},
                              )

                          ),



                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                controller: Number,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),

                                  labelText: 'Card Number *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {},
                              )

                          ),


                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: TextFormField(
                                controller: Acc_number,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  labelText: 'Account Number *',
                                ),
                                onSaved: (String value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String value) {},
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
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              setState(() {
                //deleteProfile(Uid);
                insertCard(Type.text, Number.text, Acc_number.text);
              });
              // insertProfile(Uid, Name.text, Employee_code.text, Department.text, Designation.text, Grade_pay.text, Account_number.text, Ifsc_code.text, Google_account.text);

              Navigator.pop(context, "Your card has been saved.");
            }),
      ),
    );
  }
}
