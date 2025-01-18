import 'package:flutter/material.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/userServices.dart';

class UpdateUserScreen extends StatelessWidget {
  final UserModel user;
  const UpdateUserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(user.name!),
          ElevatedButton(
              onPressed: () {
                user.name = 'Qadi';
                UserServices().editUser(user);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
