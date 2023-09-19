import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final IconData icon;
  final IconData suffixIcon;
  final IconData suffixIcon1;
  final String label;
  final TextEditingController searchController;
  final Function(String) onSearch; // Callback for search

  const CustomSearchField({
    Key? key,
    required this.icon,
    required this.label,
    required this.onSearch,
    required this.suffixIcon,
    required this.suffixIcon1,
    required this.searchController, // Pass the callback
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: TextStyle(
          color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        // fillColor: Colors.red,
        // filled: true,
        prefixIcon: Icon(icon),
        labelText: label,
        suffixIcon: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(suffixIcon, size: 30),
              SizedBox(width: 3),
              Icon(suffixIcon1, size: 40),
              SizedBox(width: 15),
            ],
          ),
        ),
        focusColor: Colors.white,
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
        // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
      ),
      onChanged: (query) {
        // Call the onSearch callback with the user's query.

        onSearch(query);
        searchController.text = query;
      },
    );
  }
}
