import 'package:flutter/material.dart';
import 'package:user_profile_management_app/data/user_model.dart';

class DetailsScreen extends StatelessWidget {
  final UserModel user;
  const DetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(user.name!));
  }
}
