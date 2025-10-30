import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/networking/supabase_service.dart';
import '../cubit/contact_cubit.dart';
import '../widgets/contact_form.dart';
import '../widgets/my_contact_info.dart';

import '../../../core/constants/text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactCubit(SupabaseService()),
      child: _buildLayout(context),
    );
  }

  Widget _buildLayout(BuildContext context) {
    if (context.isDesktop) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._buildHeaderText(context),
          20.height,
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [MyContactInfo(), ContactForm()],
          ),
        ],
      );
    }
    if (context.isTablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ..._buildHeaderText(context),
          20.height,
          const Row(spacing: 20, children: [MyContactInfo(), ContactForm()]),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ..._buildHeaderText(context),
        20.height,
        const Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 20,
          spacing: 20,
          children: [MyContactInfo(), ContactForm()],
        ),
      ],
    );
  }

  List<Widget> _buildHeaderText(BuildContext context) {
    return [
      Text(
        'Let\'s Connect',
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
        'Ready to bring your next project to life',
        textAlign: TextAlign.center,
        style: AppTextStyles.headingSmall(
          context,
        ).copyWith(fontWeight: FontWeight.w400, height: 1.4),
      ),
    ];
  }
}
