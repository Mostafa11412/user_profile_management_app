import 'package:flutter/material.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/userServices.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final UserModel user;
  const DetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: FontTheme.kBlackHeader,
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await UserServices().deleteUser(userId: user.id!);
              showDeleteDialog(context);
            },
            child: Text("Delete")),
      ),
    );
  }
}

showDeleteDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("User Deleted Succefully"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text("Ok!"))
            ],
          ));
}
