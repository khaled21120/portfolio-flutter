import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../extentions/extentions.dart';

/// ✍️ Centralized text styles with Google Fonts
class AppTextStyles {
  // Modern sans-serif font for headings
  static TextStyle headingLarge(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 36.sp,
      fontWeight: FontWeight.w700,
      color: context.colorScheme.onSurface,
      letterSpacing: -0.8,
    );
  }

  static TextStyle headingMedium(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: context.colorScheme.onSurface,
      letterSpacing: -0.3,
      height: 1.2,
    );
  }

  static TextStyle headingSmall(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: context.colorScheme.onSurface,
      letterSpacing: -0.2,
      height: 1.3,
    );
  }

  // Clean font for app bar
  static TextStyle appBar(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: context.colorScheme.onSurface,
      letterSpacing: 0.2,
    );
  }

  // Readable font for body text
  static TextStyle body(BuildContext context) => GoogleFonts.manrope(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: context.colorScheme.onSurface,
    height: 1.5,
  );

  // Body large variant
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.manrope(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: context.colorScheme.onSurface,
    height: 1.5,
  );

  // Body small variant
  static TextStyle bodySmall(BuildContext context) => GoogleFonts.manrope(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: context.colorScheme.onSurface,
    height: 1.4,
  );

  // Modern button text
  static TextStyle button(BuildContext context) => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: context.colorScheme.onSurface,
    letterSpacing: 0.1,
  );

  // Caption text
  static TextStyle caption(BuildContext context) => GoogleFonts.manrope(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: context.colorScheme.onSurfaceVariant,
    height: 1.3,
  );
}
