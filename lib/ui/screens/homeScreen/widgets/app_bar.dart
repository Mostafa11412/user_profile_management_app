import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kGreen,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      title: Text('Users'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: AdaptiveTheme.of(context).mode.isLight
                ? Icon(Icons.sunny, color: kWhite)
                : Icon(Icons.dark_mode_rounded, color: kDark),
            onTap: () => ThemeController.changeTheme(context),
          ),
        )
      ],
    );
  }
}
