import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/networking/supabase_service.dart';
import '../cubit/certifications_cubit.dart';
import '../widgets/certifications_timeline.dart';
import '../widgets/education_info.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          CertificationsCubit(SupabaseService())..fetchCertifications(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._buildHeaderText(context),
          20.height,
          const EducationInfo(),
          20.height,
          const CertificationsTimeline(),
        ],
      ).paddingTop(context.isMobile ? 20.h : 0),
    );
  }

  List<Widget> _buildHeaderText(BuildContext context) {
    return [
      Text(
        'About Me',
        style: AppTextStyles.headingLarge(context).copyWith(
          color: context.colorScheme.primary,
          fontWeight: FontWeight.w700,
          fontSize: 40.sp,
          letterSpacing: -0.5,
        ),
      ),
      8.height,
      Container(
        width: 80.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: context.colorScheme.primary.withValues(alpha: .6),
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
      12.height,
      Text(
        'Passionate developer dedicated to building amazing experiences',
        textAlign: TextAlign.center,
        style: AppTextStyles.headingSmall(
          context,
        ).copyWith(fontWeight: FontWeight.w400, height: 1.4),
      ),
    ];
  }
}
