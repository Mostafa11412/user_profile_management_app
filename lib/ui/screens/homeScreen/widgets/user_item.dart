import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';
import 'package:user_profile_management_app/data/user_model.dart';

import 'package:user_profile_management_app/ui/screens/detailsScreen/user_details.dart';

class UserItem extends StatelessWidget {
  final UserModel user;
  const UserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 08.r),
      child: ListTile(
        leading: Text(user.id.toString(), style: FontTheme.kBlackTileHeader),
        title: Text(user.name!, style: FontTheme.kBlackTileHeader),
        subtitle: Text(user.email!, style: FontTheme.kBlackTileBody),
        trailing: Icon(Icons.arrow_right_rounded, size: 30),
        onTap: () => _showUser(context),
      ),
    );
  }

  void _showUser(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (route) => UserDetailScreen(user: user),
      ),
    );
  }
}
