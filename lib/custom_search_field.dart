import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function(String) onSearch; // Callback for search
  const CustomSearchField({
    Key? key,
    required this.icon,
    required this.label,
    required this.onSearch, // Pass the callback
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000)),
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
      onChanged: (query) {
        // Call the onSearch callback with the user's query.
        onSearch(query);
      },
    );
  }
}
