import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/networking/supabase_service.dart';
import '../../../core/shared/custom_error_widget.dart';
import '../cubit/home_cubit.dart';
import '../models/user_model.dart';
import '../widgets/main_buttons.dart';

import '../cubit/home_state.dart';
import '../widgets/home_body.dart';
import '../widgets/picture_avatar.dart';

// ignore: must_be_immutable
class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(SupabaseService())..fetchUser(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (_, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => ErrorWidgetCustom(
            message: error,
            onRetry: () => context.read<HomeCubit>().fetchUser(),
          ),
          loaded: (user) {
            return _buildLayout(context, user);
          },
          orElse: () => Container(),
        ),
      ),
    );
  }

  Widget _buildLayout(BuildContext context, UserModel user) {
    if (context.isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: PersonalDetails(user: user)),
          PictureAvatar(imageUrl: user.pictureUrl).paddingRight(40.w),
        ],
      );
    }
    if (context.isTablet) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: PersonalDetails(user: user)),
          Expanded(
            child: Column(
              spacing: 30.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PictureAvatar(imageUrl: user.pictureUrl).paddingRight(40.w),
                MainButtons(user: user),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PictureAvatar(imageUrl: user.pictureUrl),
        15.height,
        PersonalDetails(user: user),
      ],
    ).paddingTop(20.h);
  }
}
