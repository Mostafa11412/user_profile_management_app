import 'package:flutter/material.dart';
import 'package:user_profile_management_app/serviceController/sharedPref_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
