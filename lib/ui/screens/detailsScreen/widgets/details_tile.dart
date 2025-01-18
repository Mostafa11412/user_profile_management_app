import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/font_theme.dart';

class DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLightMode = AdaptiveTheme.of(context).mode.isLight;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Icon(icon, size: 25.sp, color: Colors.grey),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: isLightMode
                      ? FontTheme.kBlackTileHeader
                      : FontTheme.kWhiteTileHeader,
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: isLightMode
                      ? FontTheme.kBlackTileBody
                      : FontTheme.kWhiteTileBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
