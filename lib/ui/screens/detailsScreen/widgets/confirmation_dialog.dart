import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/home_screen.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';
import '../../../../data/user_model.dart';
import '../../../../serviceController/user_services.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final UserModel user;
  final bool isLightMode;

  const DeleteConfirmationDialog({
    super.key,
    required this.user,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).dialogBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 48.r,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Delete User',
              style:
                  isLightMode ? FontTheme.kBlackHeader : FontTheme.kWhiteHeader,
            ),
            SizedBox(height: 10.h),
            Text(
              'Are you sure you want to delete this user? This action cannot be undone.',
              textAlign: TextAlign.center,
              style: isLightMode
                  ? FontTheme.kBlackTileBody
                  : FontTheme.kWhiteTileBody,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLightMode ? kGreen : kWhite,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel',
                        style: TextStyle(
                            color: isLightMode ? kWhite : kGreen,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      await UserServices().deleteUser(userId: user.id!);
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Delete',
                      style: FontTheme.kWhiteHeader,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
