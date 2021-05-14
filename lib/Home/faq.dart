import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../homepage.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}
class _FaqState extends State<Faq>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('FAQ'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              }),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ExpandablePanel(
                  header: Text("Where to access my cards?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to change my profile(name, google id, account etc)?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Click on Profile on Home Page, then on My Profile Page click on “Edit” Floating Button. Here you get a form prefilled with current profile, edit the fields you want to update to edit profile.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                ExpandablePanel(
                  header: Text(" How to Sort/Filter Trips?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Users need to select the Dropdown “Select” Button on the Top-Right Corner and select the Sorting Technique[from Total Amounts, Title Name, Start Date in Ascending or Descending order] or Filter[Favourites and Archives] and Tap them. ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to add a Trip?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Users need to click on the floating button at Bottom-left name “Add Trip” to add Trip. Clicking the button will open a form for adding trip. Fill the details required for like Title, Start Date, Notes, etc.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to Delete a Trip?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text(" To Delete trip click on the Delete button of Trip ListTile click  to Delete trip, this will open up a dialog box with prompt message, click “Yes” to Delete trip or click no.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to edit Trip Details?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("To Edit Details of a trip tap on the Trip user needs to edit and then Click on the Edit button on top right corner. This will open up an Edit Trip form similar to add trip form with prefilled information of the Trip. Edit the details and click on the Update Trip button.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to Archive Trip and View Archives?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("To Archive a trip click on the Archive button of Trip ListTile click  to Archive trip.Archive Trips can be seen by using the Select button on the Top Right corner and selecting “Archives”",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text(" How to mark your favourite trip?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text(" To favourite a trip click on the Favourite button of Trip ListTile click  to favourite a trip.Favourite Trips can be seen by using the Select button on the Top Right corner and selecting “Favourites”.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How do I add expense to my trip?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("On the trip page, click on the trip you want to add an expense to, it will open a new page with a “+” floating button. On clicking the button, we select add expense to open form for adding expenses. The add expense form opened, asks the user to select the kind of expense. There are three kinds of expenses - travel, other and personal expenses. Click on one of the options, fill up the form and click on save.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("Where to see added expense?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Go to the trip here you can see all expenses under the ‘all’ tab. For specific type of expenses, click on the relevant tab",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("What sort of expense can I add to the trip?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("The add expense form opened in the previous question, asks the user to select the kind of expense. There are three kinds of expenses - travel, other and personal expenses. The personal expenses are not accounted for in the final form or the total expense and are just for users to account for expenses informally.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to edit an expense?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Click on the trip you want to edit expenses for. Then click on the expense, there will be an edit icon at bottom of the expanded card for the expense. A prefilled form with current details will pop up, edit the required information and click on save.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text(" How to delete an expense?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Click on the expense card, and then click on the delete button.  A dialog box appears asking to confirm delete, click on ‘yes’ to delete the expense.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to add attachments to an expense?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Click on the expense card, then click on the clip icon, a dialog will appear asking to add files, here user can add the attachment to the expense",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to Export and Database file of the Application?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("To Export Database file, Click on the Export Button on the Dashboard. This will take you to the Sharing page where users can share database files through various mediums like Google Drive or Save Locally, etc.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to import a Database file to the Application?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("To Import Database file, Users first need to click on the import button on the Dashboard. This will give a dialog box with a message that the application needs to be restarted after the database file is imported. Click on the Continue button and This will direct you to the file picker, here users need to pick the Previously available Database file in local device.Now Restart your application.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("What kind of filled form can a user generate?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("There are two different options for different types of form one for IIT Ropar Employees(with IIT Ropar header) and one is a generalized version for other organizations. The user may choose to import the form in pdf or xlsx format. The user can also choose whether to add attachments to the form in pdf.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),
                ExpandablePanel(
                  header: Text("How to generate a form for reimbursement?",
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  //collapsed: Text("Cards are in profile section, can be accessed by clicking on profile icon on the home page", softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  expanded: Text("Go to My Trips on the home page. Tap on the trip for which you want to generate the form. Click on the floating action button on that trip’s page, next tap on the ‘create form button’. A dialog box appears where you can select the type(IIT Ropar or Other), format(pdf or  xlsx) and tap on add attachments and then tap on ‘Generate Form’ button to generate the form. Note : This may take a while on some devices.",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    softWrap: true, ),
                ),
                SizedBox(
                  height: 10,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Widget build(BuildContext context) {
//     return ExpandablePanel(
//       header: Text(article.title),
//       collapsed: Text(article.body, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
//       expanded: Text(article.body, softWrap: true, ),
//       tapHeaderToExpand: true,
//       hasIcon: true,
//     );
//   }
