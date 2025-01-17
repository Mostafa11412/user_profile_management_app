import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/core/themes/font_theme.dart';
import 'package:user_profile_management_app/core/themes/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showThemeIcon;
  final bool showBackButton;
  final bool isCenterTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showThemeIcon = true,
    this.showBackButton = false,
    this.isCenterTitle = false,
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
          ? Builder(
        builder: (context) {
          final isLightMode = AdaptiveTheme.of(context).mode.isLight;
          return IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: isLightMode ? kWhite : kDark,
            ),
            onPressed: () => Navigator.pop(context),
          );
        },
      )
          : null,
      title: Builder(
        builder: (context) {
          final isLightMode = AdaptiveTheme.of(context).mode.isLight;
          return Text(
            title,
            style: isLightMode ? FontTheme.kWhiteHeader : FontTheme.kBlackHeader,
          );
        },
      ),
      actions: [
        if (showThemeIcon)
          Padding(
            padding: EdgeInsets.all(8.w),
            child: GestureDetector(
              child: Builder(
                builder: (context) {
                  final isLightMode = AdaptiveTheme.of(context).mode.isLight;
                  return Icon(
                    isLightMode ? Icons.sunny : Icons.dark_mode_rounded,
                    color: isLightMode ? kWhite : kDark,
                  );
                },
              ),
              onTap: () => ThemeController.changeTheme(context),
            ),
          )
      ],
    );
  }
}