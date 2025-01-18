import 'package:flutter/material.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String iconType;
  final TextEditingController controller;
  final String type;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.iconType,
    required this.controller,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the icon based on `iconType`
    IconData? getIcon(String type) {
      switch (type) {
        case "person":
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
        prefixIcon: Icon(getIcon(iconType)),
        labelText: labelText,
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: kGreen),
        // ),
        // labelStyle: TextStyle(color: kDark),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "No $type added !!";
        }
        return null;
      },
    );
  }
}
