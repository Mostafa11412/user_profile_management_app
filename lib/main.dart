import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/themes/dark_theme.dart';
import 'package:user_profile_management_app/core/themes/light_theme.dart';
import 'package:user_profile_management_app/serviceController/shared_pref_controller.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/home_screen.dart';

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
      // Design size for screen adaptation
      designSize: const Size(360, 690),
      // Enable minimum text adaptation
      minTextAdapt: true,
      builder: (context, child) => AdaptiveTheme(
        // Light theme configuration
        light: klightTheme,
        // Dark theme configuration
        dark: kDarkTheme,
        // Initial theme mode based on system settings
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
          // Apply the light theme
          theme: theme,
          // Apply the dark theme
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'UPM-API',
          home: HomeScreen(),
        ),
      ),
    );
  }
}
