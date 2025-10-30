import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/helpers/url_helper.dart';
import '../../home/cubit/home_cubit.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/networking/supabase_service.dart';
import '../../../core/shared/custom_error_widget.dart';
import '../../home/cubit/home_state.dart';

class MyContactInfo extends StatelessWidget {
  const MyContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = context.isDesktop || context.isTablet;
    final child = BlocProvider(
      create: (_) => HomeCubit(SupabaseService())..fetchUser(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          loaded: (user) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              25.height,
              _buildContactCard(
                context: context,
                icon: FontAwesomeIcons.google,
                title: 'Email',
                subtitle: user.email ?? '',
                isLink: true,
                link: 'mailto:${user.email}',
              ),
              20.height,
              _buildContactCard(
                context: context,
                icon: FontAwesomeIcons.phone,
                title: 'Phone',
                subtitle: user.phone ?? '',
                isLink: true,
                link: 'tel:${user.phone}',
              ),
              20.height,
              _buildContactCard(
                context: context,
                icon: FontAwesomeIcons.locationDot,
                title: 'Location',
                subtitle: 'Port Said, Egypt',
                isLink: false,
              ),
              20.height,
              _buildContactCard(
                context: context,
                icon: FontAwesomeIcons.circleCheck,
                title: 'Status',
                subtitle: 'Available for freelance & remote work',
                isLink: false,
              ),
            ],
          ),
          error: (error) {
            return ErrorWidgetCustom(
              message: error,
              onRetry: () => context.read<HomeCubit>().fetchUser(),
            );
          },
          orElse: () => Container(),
        ),
      ),
    ).paddingLeft(30.w).paddingRight(30);

    return isWide ? Expanded(child: child) : child;
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 32.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withValues(alpha: 0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.work_outline_rounded,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          16.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready to work',
                  style: AppTextStyles.headingMedium(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700, color: Colors.white),
                ),
                4.height,
                Text(
                  'Let\'s build something amazing together',
                  style: AppTextStyles.body(
                    context,
                  ).copyWith(color: Colors.grey.shade300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    bool isLink = false,
    String? link,
  }) {
    final hoverNotifier = ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHovered, _) {
        return MouseRegion(
          onEnter: (_) => hoverNotifier.value = true,
          onExit: (_) => hoverNotifier.value = false,
          cursor: isLink ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..scale(isHovered ? 1.03 : 1.0)
              ..translate(0, isHovered ? -4 : 0),
            // width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.surface.withValues(alpha: .4),
                  context.colorScheme.surface.withValues(alpha: .7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: isHovered
                    ? context.colorScheme.primary
                    : context.colorScheme.primary.withValues(alpha: .4),
                width: 1.3.w,
              ),
              boxShadow: [
                if (isHovered)
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: .2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 22.sp, color: context.colorScheme.primary),
                16.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.headingSmall(context).copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      6.height,
                      Text(
                        subtitle,
                        style: AppTextStyles.body(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface.withValues(
                            alpha: .8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLink) ...[
                  const Spacer(),
                  IconButton(
                    onPressed: () => UrlHelper.launchURL(link ?? ''),
                    icon: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.externalLinkAlt,
                      size: 18.sp,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
