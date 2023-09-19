import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled4/custom_text_field.dart';
import 'package:untitled4/data_model.dart';

import 'contact_list_view.dart';
import 'custom_search_field.dart';

var leg = 0;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initializing a variable as model type
  Box<DataModel>? contacts;
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final searchController = TextEditingController();
  final homePageKey = GlobalKey<FormState>();

  String query = ''; // Store search query
  @override
  void deleteContact(int index) {
    contacts?.deleteAt(index);
    setState(() {});
  }

  void toggleFavorite(int index) {
    final contact = contacts?.getAt(index);
    if (contact != null) {
      contact.isFavorite = !contact.isFavorite;
      contacts?.putAt(index, contact);
      setState(() {});
    }
  }

  void initState() {
    // assigining hive data to a model variable
    contacts = Hive.box("hive_box");
    super.initState();
    contacts!.values.toList().sort((a, b) =>
        a.firstName!.toLowerCase().compareTo(b.firstName!.toLowerCase()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          // TextButton(
          //     onPressed: () {
          //       showDialog<void>(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: const Text('Add New contact',
          //                 style: TextStyle(fontWeight: FontWeight.bold)),
          //             content: SizedBox(
          //               height: MediaQuery.of(context).size.height / 4,
          //               child: Column(children: [
          //                 // TextField(
          //                 //   controller: firstNameController,
          //                 //   style: TextStyle(
          //                 //     color: Colors.blue,
          //                 //   ),
          //                 // ),
          //                 CustomTextField(
          //                     validation: (value) {
          //                       if (value!.isEmpty) {
          //                         return 'Please enter your phone number.';
          //                       }
          //                       return null;
          //                     },
          //                     icon: Icons.person,
          //                     label: "Frist Name",
          //                     Type: TextInputType.text,
          //                     controller: firstNameController),
          //                 // TextField(
          //                 //   controller: secondNameController,
          //                 // ),
          //                 SizedBox(height: 15),
          //                 CustomTextField(
          //                     validation: (value) {
          //                       if (value!.isEmpty) {
          //                         return 'Please enter your phone number.';
          //                       }
          //                       return null;
          //                     },
          //                     Type: TextInputType.text,
          //                     icon: Icons.person,
          //                     label: "Last Name",
          //                     controller: secondNameController),
          //                 // TextField(
          //                 //   controller: phoneNumberController,
          //                 // ),
          //                 SizedBox(height: 15),
          //                 CustomTextField(
          //                     validation: (value) {
          //                       if (value!.isEmpty) {
          //                         return 'Please enter your phone number.';
          //                       }
          //                       return null;
          //                     },
          //                     Type: TextInputType.phone,
          //                     icon: Icons.phone_android_outlined,
          //                     label: "phoneNumber",
          //                     controller: phoneNumberController),
          //               ]),
          //             ),
          //             actions: <Widget>[
          //               TextButton(
          //                 style: TextButton.styleFrom(
          //                   textStyle: Theme.of(context).textTheme.labelLarge,
          //                 ),
          //                 child: const Text('Cancel'),
          //                 onPressed: () {
          //                   firstNameController.clear();
          //                   secondNameController.clear();
          //                   phoneNumberController.clear();
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //               TextButton(
          //                 style: TextButton.styleFrom(
          //                   textStyle: Theme.of(context).textTheme.labelLarge,
          //                 ),
          //                 child: const Text('Add'),
          //                 onPressed: () {
          //                   setState(() {
          //                     contacts?.add(
          //                       DataModel(
          //                           firstName: firstNameController.text,
          //                           lastName: secondNameController.text,
          //                           phoneNumber: phoneNumberController.text),
          //                     );
          //                   });
          //                   firstNameController.clear();
          //                   secondNameController.clear();
          //                   phoneNumberController.clear();
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //     child: CircleAvatar(
          //       //radius: 30,
          //       backgroundColor: Colors.black,
          //       child: Center(
          //         child: Icon(Icons.add, color: Colors.white),
          //       ),
          //     )
          //     // Text("add")
          //     )
        ],
      ),
      body: Container(
        color: Colors.black26,
        child: Column(
          children: [
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomSearchField(
                searchController: searchController,
                icon: Icons.search,
                suffixIcon: CupertinoIcons.line_horizontal_3,
                suffixIcon1: CupertinoIcons.profile_circled,
                label: "Search name",
                onSearch: (query) {
                  setState(() {
                    this.query = query;
                    searchController.text = query;
                  });
                },
              ),
            ),
            Column(children: []),
            Expanded(
              child: ValueListenableBuilder<Box<DataModel>>(
                valueListenable: Hive.box<DataModel>('hive_box').listenable(),
                builder: (context, box, _) {
                  final contactsList = contacts!.values.toList();
                  contactsList.sort((a, b) => a.firstName!
                      .toLowerCase()
                      .compareTo(b.firstName!.toLowerCase()));
                  final filteredContacts = query.isEmpty
                      ? contactsList
                      : contactsList
                          .where((contact) =>
                              contact.firstName!
                                  .toLowerCase()
                                  .contains(query.toLowerCase()) ||
                              contact.lastName!
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                          .toList();

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListView.builder(
                        itemCount: filteredContacts.length,
                        itemBuilder: (context, index) {
                          final contact = filteredContacts[index];
                          return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            onDismissed: (direction) {
                              deleteContact(index);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  "${contact.firstName![0].toUpperCase()}${contact.lastName![0].toUpperCase()}" ??
                                      "",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Text(contact.firstName ?? ""),
                                  Text("    "),
                                  Text(contact.lastName ?? ""),
                                ],
                              ),
                              subtitle: Text(contact.phoneNumber ?? ""),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ContactListView(contact),
                                  ),
                                );
                              },
                              trailing: IconButton(
                                icon: Icon(
                                  contact.isFavorite
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                onPressed: () {
                                  // toggleFavorite(index);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add New contact',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                content: Form(
                  key: homePageKey,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(children: [
                      // TextField(
                      //   controller: firstNameController,
                      //   style: TextStyle(
                      //     color: Colors.blue,
                      //   ),
                      // ),
                      CustomTextField(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            return null;
                          },
                          icon: Icons.person,
                          label: "Frist Name",
                          Type: TextInputType.text,
                          controller: firstNameController),
                      // TextField(
                      //   controller: secondNameController,
                      // ),
                      SizedBox(height: 15),
                      CustomTextField(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            return null;
                          },
                          Type: TextInputType.text,
                          icon: Icons.person,
                          label: "Last Name",
                          controller: secondNameController),
                      // TextField(
                      //   controller: phoneNumberController,
                      // ),
                      SizedBox(height: 15),
                      CustomTextField(
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            return null;
                          },
                          Type: TextInputType.phone,
                          icon: Icons.phone_android_outlined,
                          label: "phoneNumber",
                          controller: phoneNumberController),
                    ]),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      firstNameController.clear();
                      secondNameController.clear();
                      phoneNumberController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Add'),
                    onPressed: () {
                      if (homePageKey.currentState!.validate()) {
                        print("object");
                        setState(() {
                          contacts?.add(
                            DataModel(
                                firstName: firstNameController.text,
                                lastName: secondNameController.text,
                                phoneNumber: phoneNumberController.text),
                          );
                        });
                        firstNameController.clear();
                        secondNameController.clear();
                        phoneNumberController.clear();
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
