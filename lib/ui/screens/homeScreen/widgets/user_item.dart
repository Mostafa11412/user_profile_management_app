import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/user_details.dart';

// UserItem widget to display user information in a list
class UserItem extends StatelessWidget {
  // User data model
  final UserModel user;
  final bool isOnline;
  const UserItem({super.key, required this.user, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 08.r),
      child: ListTile(
        splashColor: kYellow,
        iconColor: kYellow,
        leading: Text(user.id.toString()),
        title: Text(user.name!),
        subtitle: Text(user.email!),
        trailing: Icon(Icons.arrow_right_rounded, size: 30),
        onTap: () => _showUser(context),
      ),
    );
  }

  // Navigate to the user details screen and send user data
  void _showUser(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (route) => UserDetailScreen(user: user, isOnline: isOnline),
      ),
    );
  }
}
