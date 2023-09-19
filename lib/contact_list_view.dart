import 'package:flutter/material.dart';
import 'package:untitled4/data_model.dart';

class ContactListView extends StatefulWidget {
  final DataModel? contact;

  ContactListView(this.contact);

  @override
  State<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Contact Details'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton.icon(
            //       onPressed: () {
            //         // Implement edit action here
            //       },
            //       icon: Icon(Icons.edit),
            //       label: Text('Edit'),
            //     ),
            //   ],
            // ),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.green,
              //add profile name
              child: Text(
                "${widget.contact?.firstName![0].toString().toUpperCase()}"
                        "${widget.contact?.lastName![0].toString().toUpperCase()}" ??
                    "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),
            SizedBox(height: 20),
            Text(
              ' ${widget.contact?.firstName ?? ""}'
              ' ${widget.contact?.lastName ?? ""}',
              style: TextStyle(fontSize: 39, color: Colors.white),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call, color: Colors.white, size: 35),
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sms, color: Colors.white, size: 35),
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.video_call, color: Colors.white, size: 35),
                  color: Colors.black12,
                ),
                // E
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Call",
                    style: TextStyle(color: Colors.white, fontSize: 29)),
                SizedBox(
                  width: 15,
                ),
                Text("Text",
                    style: TextStyle(color: Colors.white, fontSize: 29)),
                SizedBox(
                  width: 15,
                ),
                Text("Video",
                    style: TextStyle(color: Colors.white, fontSize: 29)),
              ],
            ),
            // SizedBox(height: 10),
            // Text(
            //   'Last Name: ${widget.contact?.lastName ?? "N/A"}',
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(height: 10),
            // Text(
            //   'Phone Number: ${widget.contact?.phoneNumber ?? "N/A"}',
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(height: 20),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  child: Card(
                color: Colors.white12,
                child: Column(children: [
                  Text(
                    "Contact info",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      //add profile name
                      child: Icon(Icons.call),
                    ),
                    title: Row(
                      children: [
                        Text(
                          ' ${widget.contact?.phoneNumber ?? "N/A"}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "Whats App",
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                    ),
                    onTap: () {
                      print("object");
                      // Navigate to the ContactDetail page when a ListTile is tapped
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      //add profile name
                      child: Icon(Icons.chat_bubble),
                    ),
                    title: Row(
                      children: [
                        Text(
                          ' ${widget.contact?.phoneNumber ?? "N/A"}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "Telegram",
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                    ),
                    onTap: () {
                      print("object");
                      // Navigate to the ContactDetail page when a ListTile is tapped
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      //add profile name
                      child: Icon(Icons.chat),
                    ),
                    title: Row(
                      children: [
                        Text(
                          ' ${widget.contact?.phoneNumber ?? "N/A"}',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "SMS",
                      style: TextStyle(fontSize: 20, color: Colors.greenAccent),
                    ),
                    onTap: () {
                      print("object");
                      // Navigate to the ContactDetail page when a ListTile is tapped
                    },
                  )
                ]),
              )),
            ),

            Column(
              children: [
                // ElevatedButton.icon(
                //   onPressed: () {
                //     setState(() {
                //       final contactsBox = Hive.box<DataModel>('hive_box');
                //       contactsBox.delete();
                //     });
                //
                //     // Implement delete action here
                //
                //     Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const Home(),
                //         ),
                //         (route) =>
                //             false); // Close the contact details page after deleting
                //   },
                //   icon: Icon(Icons.delete),
                //   label: Text('Delete'),
                // ),
                // ElevatedButton.icon(
                //   onPressed: () {
                //     // Implement add to favorites action here
                //     final contactsBox = Hive.box<DataModel>('hive_box');
                //     final updatedContact = contact!.clone() as DataModel;
                //     updatedContact.isFavorite =
                //         !updatedContact.isFavorite; // Toggle the favorite status
                //     contactsBox.put(contact!.key, updatedContact);
                //     // Refresh the UI
                //     setState(() {
                //       contact = updatedContact;
                //     });
                //   },
                //   icon: Icon(
                //     contact!.isFavorite ? Icons.star : Icons.star_border,
                //     color: Colors.yellow,
                //   ),
                //   label: Text(contact!.isFavorite
                //       ? 'Remove from Favorites'
                //       : 'Add to Favorites'),
                // ),
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //     child: Column(
      //   children: [
      //     ElevatedButton.icon(
      //       onPressed: () {
      //         // Implement add to favorites action here
      //       },
      //       icon: Icon(Icons.star),
      //       label: Text(''),
      //     ),
      //   ],
      // )),
    );
  }
}
