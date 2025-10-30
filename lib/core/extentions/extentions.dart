import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BuildContextExtension on BuildContext {
  // 📏 Screen sizes
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  // 📱 Responsive helpers
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;

  // 🎨 Theme + Colors
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // 🧭 Navigation shortcuts
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  void pushReplacement(Widget page) => Navigator.of(
    this,
  ).pushReplacement(MaterialPageRoute(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  // 💬 Snackbar helper
  void showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}

extension WidgetExtension on Widget {
  /// 🧱 Adds padding
  Widget paddingTop(double value) => Padding(
    padding: EdgeInsets.only(top: value.h),
    child: this,
  );

  Widget paddingBottom(double value) => Padding(
    padding: EdgeInsets.only(bottom: value.h),
    child: this,
  );

  Widget paddingLeft(double value) => Padding(
    padding: EdgeInsets.only(left: value.w),
    child: this,
  );

  Widget paddingRight(double value) => Padding(
    padding: EdgeInsets.only(right: value.w),
    child: this,
  );

  /// 🧱 Adds equal padding on all sides
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value.w), child: this);

  /// 🧱 Adds symmetric horizontal/vertical padding
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal.w,
          vertical: vertical.h,
        ),
        child: this,
      );

  /// Pa
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );

  Widget onTap(VoidCallback onTap) => InkWell(onTap: onTap, child: this);
  Widget onPress(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);
}

extension GapExtensions on num {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}

extension StringExtensions on String? {
  bool get isEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this ?? '');
  bool get isNullOrEmpty => this == '' || this == null;
}
