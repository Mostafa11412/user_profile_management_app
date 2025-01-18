import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/home_screen.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';
import '../../../../data/user_model.dart';
import '../../../../serviceController/user_services.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final UserModel user;

  const DeleteConfirmationDialog({super.key, required this.user});

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
          color: AdaptiveTheme.of(context).mode.isLight ? kWhite : kBlack,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
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
            ),
            SizedBox(height: 10.h),
            Text(
              'Are you sure you want to delete this user? This action cannot be undone.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      if (!context.mounted) return;
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    },
                    child: Text('Delete', style: FontTheme.kWhiteHeader),
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
