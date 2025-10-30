import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/core/constants/text_styles.dart';
import '../extentions/extentions.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../../core/helpers/url_helper.dart';
import '../../features/home/cubit/home_state.dart';
import '../networking/supabase_service.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return BlocProvider(
      create: (context) => HomeCubit(SupabaseService())..fetchUser(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 40.h,
          horizontal: isMobile ? 24.w : 100.w,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surface.withValues(
            alpha: 0.9,
          ),
          border: Border(
            top: BorderSide(
              color: context.colorScheme.outline.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo and Socials
            if (isMobile)
              _buildMobileLayout(context)
            else
              _buildDesktopLayout(context),

            30.height,

            // Divider
            Container(
              width: 80.w,
              height: 2.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.5),
                    context.colorScheme.primary.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            25.height,

            // Copyright
            _buildCopyright(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildLogo(context), _buildSocials(context)],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [_buildLogo(context), 20.height, _buildSocials(context)],
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Portfolio',
          style: AppTextStyles.bodyLarge(context).copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.primary,
            letterSpacing: -0.5,
          ),
        ),
        4.height,
        Text(
          'Building digital experiences',
          style: AppTextStyles.caption(context).copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildSocials(BuildContext context) {
    final iconSize = 22.sp;
    final color = context.colorScheme.onSurfaceVariant;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state.maybeWhen(
        loading: () => const CircularProgressIndicator(),
        error: (message) =>
            Flexible(child: Text(message, overflow: TextOverflow.ellipsis)),
        loaded: (user) => Wrap(
          spacing: 12.w,
          runSpacing: 8.h,
          alignment: WrapAlignment.center,
          children: [
            _socialIcon(
              FontAwesomeIcons.github,
              color,
              iconSize,
              user.githubUrl ?? '',
            ),
            _socialIcon(
              FontAwesomeIcons.linkedin,
              color,
              iconSize,
              user.linkedInUrl ?? '',
            ),
            _socialIcon(
              FontAwesomeIcons.envelope,
              color,
              iconSize,
              'mailto:${user.email}',
            ),
            _socialIcon(
              FontAwesomeIcons.phone,
              color,
              iconSize,
              'tel:${user.phone}',
            ),
          ],
        ),
        orElse: () => Container(),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color, double size, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: color.withValues(alpha: 0.1), width: 1),
        ),
        child: Icon(icon, color: color.withValues(alpha: 0.8), size: size),
      ).onTap(() => UrlHelper.launchURL(url)),
    );
  }

  Widget _buildCopyright(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '© ${DateTime.now().year} Khaled. All rights reserved.',
          style: AppTextStyles.caption(context),
          textAlign: TextAlign.center,
        ),
        4.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Built with ',
              style: AppTextStyles.caption(context).copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            Icon(Icons.favorite, color: Colors.red, size: 12.sp),
            Text(
              ' & Flutter',
              style: AppTextStyles.caption(context).copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
