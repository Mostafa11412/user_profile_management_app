import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';
import '../../../../data/user_model.dart';

class UserAvatarSection extends StatelessWidget {
  final UserModel user;

  const UserAvatarSection({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        color: kGreen,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: kWhite,
            child: Text(
              user.name?[0] ?? 'U',
              style: FontTheme.kBlackHeader,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            user.name ?? 'Unknown',
            style: FontTheme.kWhiteHeader,
          ),
          Text(
            user.email ?? 'No email',
            style: FontTheme.kWhiteTileHeader,
          ),
        ],
      ),
    );
  }
}