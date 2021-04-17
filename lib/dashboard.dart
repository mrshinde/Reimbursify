import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tripmanager/Home/item.dart';
import 'package:tripmanager/classes/user.dart';
import 'package:tripmanager/Home/profile.dart';
import 'package:tripmanager/classes/itemclass.dart';
import 'package:tripmanager/trip.dart';
import 'package:share/share.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as pth;
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
// import 'package:flutter/services.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

User dummy = User(
    'Aman Dhawan',
    '11-06-1999',
    'https://scontent.fjai2-2.fna.fbcdn.net/v/t1.0-9/95362727_2741172542678274_312620172575768576_o.jpg?_nc_cat=101&_nc_sid=09cbfe&_nc_ohc=vbhflBRs8KgAX9GREOo&_nc_ht=scontent.fjai2-2.fna&oh=4041b60cd26a103cf3d82854fb469b08&oe=5F4AC925',
    34);
ItemClass one = ItemClass(
    title: 'Title_1', sdate: '19/1/2021', edate: '19/1/2021', amount: 434);
ItemClass two = ItemClass(
    title: 'Title_2', sdate: '21/3/2021', edate: '19/1/2021', amount: 2000);
ItemClass three = ItemClass(
    title: 'Title_3', sdate: '21/1/2021', edate: '19/1/2021', amount: 4000);
ItemClass four = ItemClass(
    title: 'Title_4', sdate: '21/1/2019', edate: '19/1/2021', amount: 1010);
ItemClass five = ItemClass(
    title: 'Title_5', sdate: '19/3/2019', edate: '19/1/2021', amount: 5000);
List<ItemClass> temporary = [one, two, three, four, five];
ScrollController _controller;

class _dashboardState extends State<dashboard> {
  int _selectedIndex = 0;
   String path;
  List <String> databasePaths = [];


  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle boxstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Your Trips',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YourTrip()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile(dummy)),
      );
    }
  }

  callback(newList) {
    setState(() {
      temporary = newList;
    });
  }
  
    _onShare(BuildContext context) async {
    // final RenderBox box = context.findRenderObject() as RenderBox;
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    path = pth.join(documentsDirectory.path, "reimbursement1.db");
    databasePaths.clear();
    databasePaths.add(path);
    print(databasePaths);

    if (databasePaths.isNotEmpty) {
      await Share.shareFiles(databasePaths,
          text: "reimbursment1.db",
          subject: "subject");
          // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share("reimbursment1.db",
          subject: "subject");
          // sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener); //the listener for up and down.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Dashboard'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile(dummy)),
                );
              }),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
          ]),
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // Container(alignment: Alignment.centerLeft,
            //     child: Text("Bar Chart of your Recent Trips -",  style: TextStyle(fontSize: 25, color: Colors.white))),

            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Image(
                image: AssetImage('assets/unlabeled-bars.png'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            
             Row(
              children: [
                Expanded(
                  child: ListTile(
                      title: Text('Back Up your Data'),
                      onTap: () => _onShare(context),
                  ),
                ),
                Expanded(
                    child: ListTile(
                      title: Text('Import Database'),
                      onTap: ()async{
                        FilePickerResult result = await FilePicker.platform.pickFiles();
                        List<io.File> files = result.paths.map((path) => io.File(path)).toList();

                        io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
                        path = pth.join(documentsDirectory.path, "reimbursement1.db");

                        await deleteDatabase(path);

                        Uint8List data = await files[0].readAsBytes();
                        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
                        await io.File(path).writeAsBytes(bytes);

                        io.Directory documentsDirectorya = await getApplicationDocumentsDirectory();
                        print(documentsDirectorya);
                      },
                    )
                )
              ],
            ),
            
            
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Your Recent Trips -",
                    style: TextStyle(fontSize: 30, color: Colors.white))),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: temporary.length,
                        scrollDirection: Axis.horizontal,
                        // controller: _controller,
                        itemBuilder: (Context, int index) {
                          return Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.red[500],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  temporary[index].title,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                leading: Text(
                                  temporary[index].amount.toString(),
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.green),
                                ),
                                subtitle: Text(temporary[index].sdate +
                                    " - " +
                                    temporary[index].edate),
                              ),
                            ),
                          );
                          // return Expanded(child: Container(child: new Item(temporary[index].amount , temporary[index].title, temporary[index].sdate, temporary[index].edate)));
                        }),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),

            Container(
                alignment: Alignment.centerLeft,
                child: Text("Your Reimbursments -",
                    style: TextStyle(fontSize: 30, color: Colors.white))),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: temporary.length,
                        scrollDirection: Axis.horizontal,
                        // controller: _controller,
                        itemBuilder: (Context, int index) {
                          return Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.red[500],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  temporary[index].title,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                leading: Text(
                                  temporary[index].amount.toString(),
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.green),
                                ),
                                subtitle: Text(temporary[index].sdate +
                                    " - " +
                                    temporary[index].edate),
                                // trailing: IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
                                //   setState(() {
                                //
                                //   });
                                // },),
                              ),
                            ),
                          );
                          // return Expanded(child: Container(child: new Item(temporary[index].amount , temporary[index].title, temporary[index].sdate, temporary[index].edate)));
                        }),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_rounded),
            label: 'Your Trips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
