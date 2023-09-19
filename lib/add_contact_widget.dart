// import 'package:flutter/material.dart';
//
// import 'custom_text_field.dart';
//
// void addContactWidget(
//   BuildContext context,
//   TextEditingController controller1,
//   TextEditingController controller2,
//   TextEditingController controller3,
// ) {
//   final homePageKey = GlobalKey<FormState>();
//
//   showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Add New contact',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         content: Form(
//           key: homePageKey,
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height / 3,
//             child: Column(children: [
//               // TextField(
//               //   controller: firstNameController,
//               //   style: TextStyle(
//               //     color: Colors.blue,
//               //   ),
//               // ),
//               CustomTextField(
//                   validation: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your phone number.';
//                     }
//                     return null;
//                   },
//                   icon: Icons.person,
//                   label: "Frist Name",
//                   Type: TextInputType.text,
//                   controller: controller1),
//               // TextField(
//               //   controller: secondNameController,
//               // ),
//               SizedBox(height: 15),
//               CustomTextField(
//                   validation: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your phone number.';
//                     }
//                     return null;
//                   },
//                   Type: TextInputType.text,
//                   icon: Icons.person,
//                   label: "Last Name",
//                   controller: controller2),
//               // TextField(
//               //   controller: phoneNumberController,
//               // ),
//               SizedBox(height: 15),
//               CustomTextField(
//                   validation: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your phone number.';
//                     }
//                     return null;
//                   },
//                   Type: TextInputType.phone,
//                   icon: Icons.phone_android_outlined,
//                   label: "phoneNumber",
//                   controller: controller3),
//             ]),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Cancel'),
//             onPressed: () {
//               controller1.clear();
//               controller2.clear();
//               controller3.clear();
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Add'),
//             onPressed: () {
//               if (homePageKey.currentState!.validate()) {
//                 print("object");
//                 // setState(() {
//                 //   contacts?.add(
//                 //     DataModel(
//                 //         firstName: controller1.text,
//                 //         lastName: controller2.text,
//                 //         phoneNumber: controller3.text),
//                 //   );
//                 // });
//                 controller1.clear();
//                 controller2.clear();
//                 controller3.clear();
//                 Navigator.of(context).pop();
//               }
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
