import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_styles.dart';
import '../extentions/extentions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.color,
    this.textColor,
  });
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(200, 60.h),
        backgroundColor: color ?? context.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        side: BorderSide(color: context.colorScheme.primary, width: 1.w),
      ),
      onPressed: onTap,
      icon: Icon(icon, color: textColor ?? context.colorScheme.onSurface),
      label: Text(
        text,
        style: AppTextStyles.bodySmall(context).copyWith(color: textColor),
      ),
    );
  }
}
