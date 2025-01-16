import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';

class CustomButton extends StatelessWidget {


  final VoidCallback onPressed;
  final bool isLightMode;
  final String title;
  final double width;
  final Color color;
  final IconData icon;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.isLightMode,
    required this.title,
    required this.width,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(color:  kWhite, width: 1.w),
        ),
        elevation: 0,
      ),
      // icon: Icon(
      //   Icons.person_remove_outlined,
      //   size: 30.sp,
      //   color: isLightMode ? kGreen : kWhite,
      // ),
      label: Text(
        title,
        style: TextStyle(color: isLightMode ? kWhite : kWhite, fontSize: 14.sp),
      ),
      icon: Icon( // Wrap the icon in an Icon widget
      icon,
      size: 25.sp,
      color:  kWhite,
    ),
    );
  }
}