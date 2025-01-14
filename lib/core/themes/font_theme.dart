import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';

class FontTheme {
  static TextStyle kWhiteHeader = TextStyle(
    fontSize: 20.sp,
    color: kWhite,
    fontWeight: FontWeight.bold,
  );

  static TextStyle kBlackHeader = TextStyle(
    fontSize: 20.sp,
    color: kDark,
    fontWeight: FontWeight.bold,
  );

  static TextStyle kWhiteTileHeader = TextStyle(fontSize: 14.sp, color: kWhite);

  static TextStyle kBlackTileHeader = TextStyle(fontSize: 14.sp);

  static TextStyle kWhiteTileBody = TextStyle(fontSize: 12.sp, color: kWhite);

  static TextStyle kBlackTileBody = TextStyle(fontSize: 12.sp);
}
