import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller; // Add the controller parameter
  final TextInputType Type;
  final Function(String? val) validation;
  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    required this.Type,
    required this.validation, // Initialize the controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation(value),
      keyboardType: Type,
      controller: controller, // Use the provided controller
      style: TextStyle(
        color: Color(0xFF000000),
      ),
      decoration: InputDecoration(
        fillColor: Color(0xfff4f5f9),
        filled: true,
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
