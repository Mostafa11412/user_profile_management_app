import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';

ThemeData klightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kWhite,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleTextStyle: FontTheme.kWhiteHeader,
    actionsIconTheme: IconThemeData(color: kWhite),
  ),
  listTileTheme: ListTileThemeData(
    shape: OutlineInputBorder(
      borderSide: BorderSide(color: kGreen, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: kWhite),
);
