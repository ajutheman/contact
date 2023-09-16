import 'package:flutter/material.dart';
import 'package:untitled4/data_model.dart';

//import '../home.dart'; // Import the Contact class

class ContactDetail extends StatelessWidget {
  final DataModel contact;

  ContactDetail({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                // Display the contact's avatar here if available.
                // backgroundImage: AssetImage(contact.avatar),
                ),
            SizedBox(height: 20.0),
            Text('firstName: ${contact.firstName}'),
            Text('laststName: ${contact.lastName}'),
            // Text('laststName: ${contact.fullName}'),

            Text('Phone Number: ${contact.phoneNumber}'),
            // Add more contact details as needed.
          ],
        ),
      ),
    );
  }
}
