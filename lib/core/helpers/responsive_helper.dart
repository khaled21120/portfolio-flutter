import 'package:flutter/material.dart';
import '../extentions/extentions.dart';
import '../layouts/desktop_layout.dart';
import '../layouts/mobile_layout.dart';
import '../layouts/tablet_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return const DesktopLayout();
    } else if (context.isTablet) {
      return const TabletLayout();
    } else {
      return const MobileLayout();
    }
  }
}
