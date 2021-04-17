

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
          title: Text('Edit Cards'),
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
}//backgroundColor: Colors.white,
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