import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData klightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kWhite,
  //
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: FontTheme.kBlackHeader,
    actionsIconTheme: IconThemeData(color: kBlack),
  ),
  //
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    leadingAndTrailingTextStyle: FontTheme.kBlackMediumHeader,
    titleTextStyle: FontTheme.kBlackMediumHeader,
    subtitleTextStyle: FontTheme.kBlackMediumBody,
  ),
  //
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kBlack,
  ),
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      minimumSize: Size(0.3.sh, 0.06.sh),
      textStyle: FontTheme.kBlackSnack,
      foregroundColor: kBlack,
      iconColor: kBlack,
      iconSize: 25.sp,
    ),
  ),
  //
  snackBarTheme: SnackBarThemeData(
    backgroundColor: kYellow,
    contentTextStyle: FontTheme.kBlackSnack,
    elevation: 10,
    showCloseIcon: true,
    closeIconColor: kBlack,
  ),
  //
  textTheme: TextTheme(bodyMedium: FontTheme.kBlackMediumBody),
  //
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 2.0),
    ),
    labelStyle: TextStyle(
      color: kDark,
    ),
    floatingLabelStyle: TextStyle(
      color: kGreen,
    ),
    prefixIconColor: kDark,
  ),
);
