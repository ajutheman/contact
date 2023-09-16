import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
                  title: Text(contacts?.get(index)?.firstName ?? ""),
                  subtitle: Text(contacts?.get(index)?.phoneNumber ?? ""),
                  onTap: () {},
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
                title: const Text('Basic dialog title'),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(children: [
                    TextField(controller: firstNameController),
                    TextField(
                      controller: secondNameController,
                    ),
                    TextField(
                      controller: phoneNumberController,
                    ),
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
