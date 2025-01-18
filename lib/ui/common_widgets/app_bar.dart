import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeIcon;
  final bool showBackButton;
  final bool isCenterTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showThemeIcon = false,
    this.showBackButton = true,
    this.isCenterTitle = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterTitle,
      backgroundColor: kGreen,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(title),
      actions: [
        if (showThemeIcon)
          Padding(
            padding: EdgeInsets.all(8.w),
            child: GestureDetector(
              child: AdaptiveTheme.of(context).mode.isLight
                  ? Icon(Icons.dark_mode_rounded)
                  : Icon(Icons.sunny),
              onTap: () => ThemeController.changeTheme(context),
            ),
          )
      ],
    );
  }
}
