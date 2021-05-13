import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:tripmanager/classes/travelexpense.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tripmanager/classes/tripclass.dart';

class attachments extends StatefulWidget {
  attachments(this.add, this.serial_number, this.tripid, this.callback);
  final String add;
  final int serial_number;
  final int tripid;
  Function() callback;
  @override
  _attachmentsState createState() => _attachmentsState();
}

class _attachmentsState extends State<attachments> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.fromLTRB(8, 10, 8, 20),
        margin: EdgeInsets.all(30.0),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 16,
          child: SingleChildScrollView(
            child: Column(
              children: [
                (() {
                  if (this.widget.add == '') {
                    return RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () async {
                        FilePickerResult result = await FilePicker.platform
                            .pickFiles(type: FileType.any);
                        if (result != null) {
                          String path = result.paths.first;
                          print(path);
                          await updateaddress(path, this.widget.serial_number);
                          await updateLastModified(this.widget.tripid);
                          this.widget.callback();
                          Navigator.of(context).pop();
                          setState(() {});
                        }
                      },
                      child: Text('Add File'),
                    );
                    ;
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RaisedButton(
                                color: Colors.blueAccent,
                                onPressed: () async {
                                  // OpenFile.open('$path/Output.pdf');
                                  print(this.widget.add);
                                  final _result =
                                      await OpenFile.open(this.widget.add);
                                  print(_result);
                                  this.widget.callback();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Open'),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () async {
                                  await updateaddress(
                                      '', this.widget.serial_number);
                                  await updateLastModified(this.widget.tripid);

                                  this.widget.callback();
                                  Navigator.of(context).pop();
                                  setState(() {});
                                },
                                color: Colors.red,
                              )
                            ],
                          ),
                          Container(
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () async {
                                FilePickerResult result = await FilePicker
                                    .platform
                                    .pickFiles(type: FileType.any);
                                if (result != null) {
                                  String path = result.paths.first;
                                  print(path);
                                  await updateaddress(
                                      path, this.widget.serial_number);
                                  await updateLastModified(this.widget.tripid);

                                  this.widget.callback();
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Update'),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }()),
              ],
            ),
          ),
        ));
  }
}
