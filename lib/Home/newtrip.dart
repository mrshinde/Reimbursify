import 'package:flutter/material.dart';
import '../database.dart';
import 'package:tripmanager/temp.dart';

class Trip extends StatefulWidget {
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

  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> {
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
    return InkWell(
      onTap: () {
        print("tapped");
        print(widget.id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Temp(widget.id)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
            border: Border.all(
              color: Colors.purpleAccent,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 20.0),
            ),
            // leading: Text(
            //   widget.amount.toString(),
            //   style: TextStyle(fontSize: 27.0, color: Colors.green),
            // ),
            subtitle: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u{20B9} ' + widget.amount.toString(),
                    style: TextStyle(fontSize: 23.0, color: Colors.green),
                  ),
                  Text(widget.start_date),
                ]),
            trailing:
                // Column(
                //   children: [
                Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.archive_outlined),
                  onPressed: () => widget.onArchive(),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => widget.onPressed(),
                ),
                IconButton(
                  icon: widget.favIcon,
                  // if(fav){}
                  onPressed: () => widget.onfav(),
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
