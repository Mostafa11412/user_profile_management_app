import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData klightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kWhite,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: FontTheme.kWhiteHeader,
    actionsIconTheme: IconThemeData(color: kWhite),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kWhite,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kYellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minimumSize: Size(0.3.sh, 0.06.sh),
      textStyle: FontTheme.kBlackTileHeader,
      foregroundColor: kDark,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: kYellow,
    contentTextStyle: FontTheme.kBlackTileHeader,
    elevation: 10,
    showCloseIcon: true,
  ),
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
