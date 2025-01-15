import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/themes/font_theme.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;
  final bool isLightMode;

  const InfoSection({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
    required this.isLightMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AdaptiveTheme.of(context).mode.isLight
            ? kAnotherLightGreen
            : Colors.grey[850], // darker shade for dark mode
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AdaptiveTheme.of(context).mode.isLight
                ? Colors.black.withOpacity(0.05)
                : Colors.black.withOpacity(0.3), // stronger shadow for dark mode
            blurRadius: AdaptiveTheme.of(context).mode.isLight ? 10 : 15,
            offset: Offset(0, AdaptiveTheme.of(context).mode.isLight ? 5 : 8),
          ),
        ],
        border: Border.all(
          color: AdaptiveTheme.of(context).mode.isLight
              ? Colors.grey.withOpacity(0.1)
              : Colors.grey[700]!, // subtle border for dark mode
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 24.sp,
                  color: AdaptiveTheme.of(context).mode.isLight
                      ? kGreen
                      : kGreen.withOpacity(0.8), // slightly muted green for dark mode
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: isLightMode
                      ? FontTheme.kBlackHeader
                      : FontTheme.kWhiteHeader,
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: AdaptiveTheme.of(context).mode.isLight
                ? Colors.grey[300]
                : Colors.grey[700], // theme-aware divider color
          ),
          ...children,
        ],
      ),
    );
  }
}