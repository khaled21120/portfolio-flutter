import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../widgets/skills_grid_view.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/networking/supabase_service.dart';
import '../cubits/skills_cubit.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SkillsCubit(SupabaseService())..fetchSkills(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderText(context),
          20.height,
          const SkillsGridView(),
        ],
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Technical Skills',
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
            'Continuously evolving with the latest technologies',
            textAlign: TextAlign.center,
            style: AppTextStyles.headingSmall(
              context,
            ).copyWith(fontWeight: FontWeight.w400, height: 1.4),
          ),
        ],
      )
    ;
  }
}
