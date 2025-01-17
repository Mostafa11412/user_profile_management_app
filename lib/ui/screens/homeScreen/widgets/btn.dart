import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final void Function() onPress;
  const CustomBtn({super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(label),
    );
  }
}
