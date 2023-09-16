import 'package:flutter/material.dart';
import 'package:untitled4/data_model.dart';

class ContactDetailPage extends StatelessWidget {
  final DataModel contact;

  ContactDetailPage({required this.contact});

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
              backgroundColor: Colors.black,
              child: Text(
                contact.firstName!,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            Text('Name: ${contact.firstName}'),
            Text('Phone Number: ${contact.phoneNumber}'),
            // Add more contact details as needed.
            ElevatedButton(
              onPressed: () {
                // Implement the functionality to make a call.
                // You can use packages like 'url_launcher' to make the call.
              },
              child: Text('Make Call'),
            ),
            // Add more functionality buttons here.
          ],
        ),
      ),
    );
  }
}
