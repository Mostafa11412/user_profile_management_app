import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/themes/dark_theme.dart';
import 'package:user_profile_management_app/core/themes/light_theme.dart';
import 'package:user_profile_management_app/serviceController/sharedPref_controller.dart';

import 'package:user_profile_management_app/ui/screens/homeScreen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrenceController.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => AdaptiveTheme(
        light: klightTheme,
        dark: kDarkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
          theme: theme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomeScreen(),
        ),
      ),
    );
  }
}
