import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/user_details.dart';

import '../../../../data/user_model.dart';

// A widget to display a user card with basic user information
class UserCard extends StatelessWidget {
  final UserModel user; // The user data to display in the card

  // Constructor to initialize the UserCard with user data
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A card widget to display user details in a structured format
    return Card(
      margin: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        // Leading avatar displaying the first letter of the user's name
        // leading: CircleAvatar(
        //   child: Text(user.name[0]),
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        // ),
        // Title displaying the user's name
        title: Text(user.name!),
        // Subtitle displaying the user's email
        subtitle: Text(user.email!),
        // Trailing icon indicating more details are available
        trailing: Icon(Icons.arrow_forward_ios),
        // Navigate to the UserDetailScreen when the card is tapped
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UserDetailScreen(user: user, isOnline: true),
            ),
          );
        },
      ),
    );
  }
}
