import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:tripmanager/classes/otherexpense.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tripmanager/classes/tripclass.dart';

class attachments2 extends StatefulWidget {
  attachments2(this.add, this.serial_number, this.tripid, this.callback);
  final String add;
  final int tripid;
  final int serial_number;
  Function() callback;
  @override
  _attachments2State createState() => _attachments2State();
}

class _attachments2State extends State<attachments2> {
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
                  if (this.widget.add == null || this.widget.add == '') {
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
                                  setState(() {});
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
