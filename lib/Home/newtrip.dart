import 'package:flutter/material.dart';
import '../database.dart';
import 'package:tripmanager/temp.dart';

class Trip extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onfav;
  final VoidCallback onArchive;
  Icon favIcon;
  Trip(this.id, this.amount, this.title, this.start_date, this.end_date,
      this.onPressed, this.onfav, this.onArchive, this.favIcon);
  double amount;
  int id;
  String title;
  String start_date;
  String end_date;
  int complete;
  double total;
  int fav;
  String note;
  String budget_head;
  String last_modified;
  double advance;
  int archive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      // width: 100,
      // height: 1000,
      // width: 1000,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Temp(1)),
          );
        },
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20.0),
            ),
            leading: Text(
              amount.toString(),
              style: TextStyle(fontSize: 27.0, color: Colors.green),
            ),
            subtitle: Text(start_date + " - " + end_date),
            trailing:
                // Column(
                //   children: [
                Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.archive_outlined),
                  onPressed: () => onArchive(),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onPressed(),
                ),
                IconButton(
                  icon: favIcon,
                  // if(fav){}
                  onPressed: () => onfav(),
                ),
              ],
              // ),
              // TextButton(
              //   child: Text('Archive'),
              //   onPressed: (){
              //
              //   },
              // )
              // ],
            )),
      ),
    );
  }
}
