import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extentions/extentions.dart';
import '../services/prefs_service.dart';
import '../constants/app_constants.dart';
import '../constants/text_styles.dart';
import 'toggle_theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onSkillsTap,
    this.onProjectsTap,
    this.onContactTap,
  });

  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onSkillsTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final isLoggedIn = PrefsService.getBool(AppConstants.isSignedIn) ?? false;

    if (isMobile) return _buildMobileAppBar(context, isLoggedIn);

    return _buildDesktopAppBar(context, isLoggedIn);
  }

  // 📱 Mobile AppBar
  AppBar _buildMobileAppBar(BuildContext context, bool isLoggedIn) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.colorScheme.surface.withValues(alpha: 0.95),
      surfaceTintColor: Colors.transparent,
      title: Text(
        'Portfolio',
        style: AppTextStyles.headingSmall(context).copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.primary,
        ),
      ),
      centerTitle: true,
      leading: Builder(
        builder: (ctx) => IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: context.colorScheme.onSurface,
            size: 24,
          ),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
        ),
      ),
      actions: [
        const ThemeSwitcher(),
        SizedBox(width: 12.w),
        _buildAuthButton(context, isLoggedIn, true),
        SizedBox(width: 16.w),
      ],
    );
  }

  // 💻 Desktop/Tablet AppBar
  AppBar _buildDesktopAppBar(BuildContext context, bool isLoggedIn) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.colorScheme.surface.withValues(alpha: 0.95),
      surfaceTintColor: Colors.transparent,
      title: Text(
        'Portfolio',
        style: AppTextStyles.headingSmall(context).copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.primary,
        ),
      ),
      actions: [
        _buildNavButton(context, 'Home', onHomeTap),
        _buildNavButton(context, 'About', onAboutTap),
        _buildNavButton(context, 'Skills', onSkillsTap),
        _buildNavButton(context, 'Projects', onProjectsTap),
        _buildNavButton(context, 'Contact', onContactTap),
        SizedBox(width: 24.w),
        const ThemeSwitcher(),
        SizedBox(width: 15.w),
        _buildAuthButton(context, isLoggedIn, false),
        SizedBox(width: 15.w),
      ],
    );
  }

  // 🧭 Navigation Button (Desktop)
  Widget _buildNavButton(
    BuildContext context,
    String title,
    VoidCallback? onTap,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            foregroundColor: context.colorScheme.onSurface,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            title,
            style: AppTextStyles.body(
              context,
            ).copyWith(fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
        ),
      ),
    );
  }

  // 🔐 Auth Button
  Widget _buildAuthButton(
    BuildContext context,
    bool isLoggedIn,
    bool isMobile,
  ) {
    return SizedBox(
      height: 36.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: context.colorScheme.primary,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.w : 20.w,
            vertical: 10.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () {},
        child: Text(
          isLoggedIn ? 'Logout' : 'Login',
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // 📂 Drawer for Mobile
  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drawer Header
          Container(
            padding: EdgeInsets.fromLTRB(24.w, 56.h, 24.w, 24.h),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.outline.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Portfolio',
                  style: AppTextStyles.headingMedium(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colorScheme.primary,
                  ),
                ),
                8.height,
                Text(
                  'Navigation Menu',
                  style: AppTextStyles.body(
                    context,
                  ).copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                _buildDrawerItem(
                  context,
                  Icons.home_rounded,
                  'Home',
                  onHomeTap,
                ),
                _buildDrawerItem(
                  context,
                  Icons.person_rounded,
                  'About',
                  onAboutTap,
                ),
                _buildDrawerItem(
                  context,
                  Icons.code_rounded,
                  'Skills',
                  onSkillsTap,
                ),
                _buildDrawerItem(
                  context,
                  Icons.work_rounded,
                  'Projects',
                  onProjectsTap,
                ),
                _buildDrawerItem(
                  context,
                  Icons.email_rounded,
                  'Contact',
                  onContactTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🧱 Drawer Item
  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback? onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: context.colorScheme.onSurfaceVariant,
        size: 20,
      ),
      title: Text(
        title,
        style: AppTextStyles.body(
          context,
        ).copyWith(fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.pop(context);
        onTap?.call();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    );
  }
}
