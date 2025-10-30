import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/constants/colors.dart';

class EducationInfo extends StatefulWidget {
  const EducationInfo({super.key});

  @override
  State<EducationInfo> createState() => _EducationInfoState();
}

class _EducationInfoState extends State<EducationInfo> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
        horizontal: isMobile ? 0 : 40.w,
      ),
      child: Wrap(
        spacing: 40.w,
        runSpacing: 20.h,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400.w),
            child: Text(
              "I'm a Computer Science student passionate about crafting sleek, performant Flutter apps. "
              "I love bridging design and functionality to create intuitive mobile experiences.",
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: AppTextStyles.body(context).copyWith(
                color: context.colorScheme.onSurface.withValues(alpha: .8),
                fontSize: 15.sp,
                height: 1.6,
              ),
            ),
          ),

          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            cursor: SystemMouseCursors.click,
            child: _buildEducationCard(context, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, bool isMobile) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      transform: Matrix4.identity()
        ..scale(isHovered ? 1.03 : 1.0)
        ..translate(0, isHovered ? -5 : 0),
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
              : AppColors.darkPrimary.withValues(alpha: .3),
          width: 1.5.w,
        ),
        boxShadow: [
          if (isHovered)
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: .2),
              blurRadius: 25,
              spreadRadius: 3,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.graduationCap,
                size: 22.sp,
                color: context.colorScheme.primary,
              ),
              12.width,
              Text(
                'Education',
                style: AppTextStyles.headingMedium(context).copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          16.height,
          Text(
            'Bachelor of Computer Science',
            style: AppTextStyles.headingSmall(
              context,
            ).copyWith(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
          5.height,
          Text(
            'Suez Canal University (2021 - 2025)',
            style: AppTextStyles.body(context).copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: .7),
            ),
          ),
          5.height,
          Text(
            'Grade: Very Good',
            style: AppTextStyles.body(context).copyWith(
              color: context.colorScheme.onSurface.withValues(alpha: .7),
            ),
          ),
        ],
      ),
    );
  }
}
