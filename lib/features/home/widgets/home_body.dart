import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/shared/slide_widget.dart';
import '../models/user_model.dart';
import 'main_buttons.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key, this.user});
  final UserModel? user;

  @override
  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final paddingLeft = isMobile ? 15.0 : context.width * 0.08;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Greeting with enhanced animation
        SlideInWidget(
          direction: AxisDirection.left,
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          child: Text(
            'Hello, I\'m',
            style: AppTextStyles.headingSmall(context),
          ),
        ),

        12.height,

        // Name with enhanced typewriter effect
        AnimatedTextKit(
          pause: const Duration(milliseconds: 500),
          animatedTexts: [
            TypewriterAnimatedText(
              user?.name ?? 'Your Name',
              textStyle: AppTextStyles.headingLarge(
                context,
              ).copyWith(color: context.colorScheme.primary, fontSize: 40),

              speed: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            ),
          ],
        ),

        16.height,

        // Professional title with slide and fade
        SlideInWidget(
          direction: AxisDirection.right,
          duration: const Duration(milliseconds: 800),
          delay: const Duration(milliseconds: 400),
          child: Text(
            'Flutter Developer • Mobile App Specialist',
            style: AppTextStyles.headingMedium(
              context,
            ).copyWith(color: context.colorScheme.primary),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),

        20.height,

        // Description with staggered animation
        SlideInWidget(
          direction: AxisDirection.down,
          duration: const Duration(milliseconds: 1000),
          delay: const Duration(milliseconds: 600),
          child: Column(
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Text(
                user?.description ?? '',
                style: AppTextStyles.body(context),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),

              // Tech highlights
              24.height,
              _buildTechHighlights(context, isMobile),

              // Buttons for non-tablet screens
              if (!context.isTablet) ...[32.height, MainButtons(user: user)],
            ],
          ),
        ),
      ],
    ).paddingOnly(
      left: paddingLeft,
      top: 20.h,
      right: isMobile ? 15.w : 0,
      bottom: 40.h,
    );
  }

  Widget _buildTechHighlights(BuildContext context, bool isMobile) {
    final highlights = [
      '🚀 Cross-Platform Development',
      '🎯 Clean Architecture',
      '⚡ High Performance',
      '🔧 State Management',
      '📱 Native Integration',
      '🎨 Beautiful UI/UX',
    ];

    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: highlights
          .map((highlight) => _buildHighlightChip(context, highlight))
          .toList(),
    );
  }

  Widget _buildHighlightChip(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption(context).copyWith(
          fontWeight: FontWeight.w500,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
