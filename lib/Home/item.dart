import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item(this.sign,this.amount,this.note,this.date);
  String sign;
  double amount;
  String note;
  String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(note,style: TextStyle(fontSize: 20.0),),
        leading: Text(amount.toString(),style: TextStyle(fontSize: 30.0,color: Colors.green),),
        subtitle: Text(date),
      ),
    );
  }
}
