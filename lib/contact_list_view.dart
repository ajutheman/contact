import 'package:flutter/material.dart';

import '../contact_detail.dart';
import 'data_model.dart';
// Assuming 'Contact' class is defined in home.dart

class ContactListView extends StatelessWidget {
  final List<DataModel> contacts;

  ContactListView({required this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              // You can use an image here if you have one for each contact.
              // backgroundImage: AssetImage(contacts[index].avatar),
              // child: Text(contacts[index].initials), // Or display initials.
              ),
          title: Text(contacts[index].firstName!),
          subtitle: Text(contacts[index].phoneNumber!),
          onTap: () {
            // Implement an action when a contact is tapped.
            // For example, you can open a detailed view of the contact.
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetail(
                    contact: DataModel(
                      phoneNumber: contacts[index].phoneNumber,
                      firstName: contacts[index].firstName,
                      lastName: contacts[index].lastName,
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
