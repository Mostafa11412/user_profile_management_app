import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;
  final Color colorSide;
  final IconData icon;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
    required this.colorSide,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: colorSide, width: 1.w),
        ),
      ),
      label: Text(title),
      icon: Icon(icon, size: 25.sp),
    );
  }
}
