import 'package:flutter/material.dart';
import 'package:tripmanager/Home/editcards.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/Home/editcards.dart';

class mycards extends StatelessWidget {
  String type = "Debit Card";
  String cardnumber = "348492034";
  String account_number = '12345678';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text("Edit"),
          backgroundColor: Colors.deepPurple,
        ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('My Cards'),
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
                                      "Card Type: " +
                                          type +
                                          "\nCard Number: " +
                                          cardnumber +
                                          "\nAccount Number: " +
                                          account_number,
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
                                      "Card Type: " +
                                          "Credit Card" +
                                          "\nCard Number: " +
                                          "4839027348" +
                                          "\nAccount Number: " +
                                          "4980928340",
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
//ListTile(
//                           //leading: Icon(Icons.add),
//                           title: Text(type+': '+ cardnumber,textScaleFactor: 1.5,
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           ),
//                          // trailing: Icon(Icons.done),
//                           subtitle: Text('Acc no: '+ account_number,
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           selected: true,
//                         ),
