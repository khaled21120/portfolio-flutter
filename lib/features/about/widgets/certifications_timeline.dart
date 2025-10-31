import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/shared/custom_error_widget.dart';
import '../cubit/certifications_cubit.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../cubit/certifications_state.dart';
import 'certifcation_item.dart';

class CertificationsTimeline extends StatelessWidget {
  const CertificationsTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificationsCubit, CertificationsState>(
      builder: (context, state) => state.maybeWhen(
        certificationsLoading: () => Center(
          child: CircularProgressIndicator(color: context.colorScheme.primary),
        ),
        certificationsError: (error) => Center(
          child: ErrorWidgetCustom(
            message: error,
            onRetry: () =>
                context.read<CertificationsCubit>().fetchCertifications(),
          ),
        ),
        certificationsLoaded: (certifications) => Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 40.h, right: 24.w),
          child: Timeline.tileBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            theme: TimelineThemeData(
              nodePosition: 0.1,
              color: context.colorScheme.primary,
              connectorTheme: ConnectorThemeData(
                color: context.colorScheme.primary.withValues(alpha: 0.2),
                thickness: 3.w,
              ),
              indicatorTheme: IndicatorThemeData(
                color: context.colorScheme.primary,
                size: 20.w,
              ),
            ),
            builder: TimelineTileBuilder.connected(
              connectionDirection: ConnectionDirection.before,
              contentsAlign: ContentsAlign.basic,
              indicatorBuilder: (_, index) => Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              connectorBuilder: (_, index, __) => SolidLineConnector(
                color: context.colorScheme.primary.withValues(alpha: 0.2),
                space: 6.w,
              ),
              contentsBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 32.h),
                child: CertificationItem(certification: certifications[index]),
              ),
              itemCount: certifications.length,
            ),
          ),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}
