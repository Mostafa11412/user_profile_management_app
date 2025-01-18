import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData kDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kDark,
  //
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: FontTheme.kWhiteHeader,
    actionsIconTheme: IconThemeData(color: kWhite),
  ),
  //
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    leadingAndTrailingTextStyle: FontTheme.kWhiteMediumHeader,
    titleTextStyle: FontTheme.kWhiteMediumHeader,
    subtitleTextStyle: FontTheme.kWhiteMediumBody,
  ),
  //
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kWhite,
  ),
  //
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      minimumSize: Size(0.3.sh, 0.06.sh),
      textStyle: FontTheme.kWhiteSnack,
      foregroundColor: kWhite,
      iconColor: kWhite,
      iconSize: 25.sp,
    ),
  ),
  //
  snackBarTheme: SnackBarThemeData(
    backgroundColor: kYellow,
    contentTextStyle: FontTheme.kWhiteSnack,
    elevation: 10,
    showCloseIcon: true,
    closeIconColor: kWhite,
  ),
  //
  textTheme: TextTheme(bodyMedium: FontTheme.kWhiteMediumBody),
  //
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 2.0),
    ),
    labelStyle: TextStyle(
      color: kGrey,
    ),
    floatingLabelStyle: TextStyle(
      color: kGreen,
    ),
    prefixIconColor: kGrey,
  ),
);
