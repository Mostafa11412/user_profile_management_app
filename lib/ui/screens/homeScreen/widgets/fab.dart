import 'package:flutter/material.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';

class CustomFab extends StatelessWidget {
  final void Function() onPress;
  const CustomFab({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: kYellow,
      child: Icon(Icons.add_rounded),
    );
  }
}
