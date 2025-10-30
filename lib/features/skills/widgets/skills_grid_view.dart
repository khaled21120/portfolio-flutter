import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/extentions/extentions.dart';

import '../../../../core/shared/custom_error_widget.dart';
import '../cubits/skills_cubit.dart';
import '../cubits/skills_state.dart';
import 'skills_gird_item.dart';

class SkillsGridView extends StatelessWidget {
  const SkillsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsCubit, SkillsState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        skillsLoading: () => const Center(child: CircularProgressIndicator()),
        skillsError: (error) => ErrorWidgetCustom(
          message: error,
          onRetry: () => context.read<SkillsCubit>().fetchSkills(),
        ),
        skillsLoaded: (skills) => Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.colorScheme.primary.withValues(alpha:0.2),
                  width: 1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.shadow.withValues(alpha: .1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height:10,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  12.width,
                  Text(
                    '${skills.length} Technical Skills',
                    style: AppTextStyles.body(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            30.height,
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 10,
              runSpacing: 10,
              children: skills.map((skill) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    minWidth: 160,
                    minHeight: 200,
                  ),
                  child: SkillsGirdItem(skill: skill),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
