import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';

class DeleteButton extends StatelessWidget {


  final VoidCallback onPressed;
  final bool isLightMode;

  const DeleteButton({
    Key? key,
    required this.onPressed,
    required this.isLightMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isLightMode ? Colors.red : Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
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
            'Delete User',
            style: FontTheme.kBlackHeader.copyWith(
              color: isLightMode ? kWhite : kWhite,
            ),
          ),
        ),
      ),
    );
  }
}