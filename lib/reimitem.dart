import 'package:flutter/material.dart';
import 'package:tripmanager/classes/reimbursements.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> deleteFile(File file) async {
  try {
    if (await file.exists()) {
      await file.delete();
    }
  } catch (e) {
    // Error in getting access to the file.
  }
}

class ItemR extends StatefulWidget {
  ItemR(this.serial_number, this.file_name, this.type, this.title, this.date,
      this.callback);
  final int serial_number;
  final String file_name;
  final String type;
  final String title;
  final String date;
  Function() callback;
  @override
  _ItemRState createState() => _ItemRState();
}

class _ItemRState extends State<ItemR> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.red[500],
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
                  widget.type,
                  style: TextStyle(fontSize: 23.0, color: Colors.green),
                ),
                Text(widget.date),
              ]),
          trailing:
              // Column(
              //   children: [
              Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete?'),
                          content: Text('Do you want to delete the file?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () async {
                                await deleteItemReimbursements(
                                    widget.serial_number);
                                await deleteFile(File(widget.file_name));

                                print("deleted");
                                final snackBar =
                                    SnackBar(content: Text('File Deleted!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                widget.callback();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  // onPressed: () => widget.onPressed(),
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
    );
  }
}
