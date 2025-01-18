import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData kDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kDark,
  appBarTheme: AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle.dark,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: FontTheme.kBlackHeader,
    actionsIconTheme: IconThemeData(color: kDark),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: kDark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kYellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minimumSize: Size(0.3.sh, 0.06.sh),
      textStyle: FontTheme.kWhiteTileHeader,
      foregroundColor: kWhite,
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
      borderSide: BorderSide(color: kGreen, width: 2.0), // Focused bottom line
    ),
    labelStyle: TextStyle(
      color: kGrey, // Default label text color
    ),
    floatingLabelStyle: TextStyle(
      color: kGreen, // Label color when focused
    ),
    prefixIconColor: kGrey, // Default icon color
  ),
);
