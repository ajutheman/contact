import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled4/custom_text_field.dart';
import 'package:untitled4/data_model.dart';

import 'custom_search_field.dart';

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

  @override
  void initState() {
    // assigining hive data to a model variable
    contacts = Hive.box("hive_box");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          CustomSearchField(
            icon: Icons.search,
            label: "Search name",
            onSearch: (query) {
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: contacts?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    //add profile name
                    child: Text(
                      "${contacts?.get(index)?.firstName![0].toString().toUpperCase()}"
                              "${contacts?.get(index)?.lastName![0].toString().toUpperCase()}" ??
                          "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(contacts?.get(index)?.firstName ?? ""),
                      Text("    "),
                      Text(contacts?.get(index)?.lastName ?? ""),
                    ],
                  ),
                  subtitle: Text(contacts?.get(index)?.phoneNumber ?? ""),
                  onTap: () {
                    print("object");
                    // // Navigate to the ContactDetail page when a ListTile is tapped
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         ContactListView(contacts: contacts[index]),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add New contact'),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(children: [
                    // TextField(
                    //   controller: firstNameController,
                    //   style: TextStyle(
                    //     color: Colors.blue,
                    //   ),
                    // ),
                    CustomTextField(
                        icon: Icons.person,
                        label: "Frist Name",
                        controller: firstNameController),
                    // TextField(
                    //   controller: secondNameController,
                    // ),
                    SizedBox(height: 15),
                    CustomTextField(
                        icon: Icons.person,
                        label: "Last Name",
                        controller: secondNameController),
                    // TextField(
                    //   controller: phoneNumberController,
                    // ),
                    SizedBox(height: 15),
                    CustomTextField(
                        icon: Icons.phone_android_outlined,
                        label: "phoneNumber",
                        controller: phoneNumberController),
                  ]),
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
