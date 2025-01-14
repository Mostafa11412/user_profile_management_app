import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData kDarkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kDark,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    titleTextStyle: FontTheme.kBlackHeader,
    actionsIconTheme: IconThemeData(color: kDark),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: kDark),
);
