import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the icon based on `Label`
    IconData? getIcon(String type) {
      switch (label.toLowerCase()) {
        case "name":
          return Icons.person_outline_rounded;
        case "email":
          return Icons.email;
        case "phone":
          return Icons.phone;
        case "website":
          return Icons.web;
        case "username":
          return Icons.person_pin;
        default:
          return Icons.help_outline;
      }
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(getIcon(label)),
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "No $label added !!";
        }
        return null;
      },
    );
  }
}
