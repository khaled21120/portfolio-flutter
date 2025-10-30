import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/constants/text_styles.dart';

class GlowCircularProgress extends StatelessWidget {
  const GlowCircularProgress({
    super.key,
    required this.progressController,
    required this.glowController,
  });

  final AnimationController progressController;
  final AnimationController glowController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([progressController, glowController]),
      builder: (context, child) {
        final progressValue = progressController.value;
        final glowValue = glowController.value;

        final glowScale = 1.0 + glowValue * 0.15;
        final glowOpacity = 0.3 + glowValue * 0.2;

        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer Glow Effect
            Transform.scale(
              scale: glowScale,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      context.colorScheme.primary.withValues(
                        alpha: glowOpacity * 0.6,
                      ),
                      context.colorScheme.primary.withValues(alpha: 0.0),
                    ],
                    stops: const [0.1, 1.0],
                  ),
                ),
              ),
            ),

            // Progress Container
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.shadow.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background Circle
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: 1.0,
                      strokeWidth: 10.w,
                      color: context.colorScheme.outline.withValues(alpha: 0.1),
                    ),
                  ),

                  // Progress Circle
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progressValue,
                      strokeWidth: 10.w,
                      strokeCap: StrokeCap.round,
                      valueColor: AlwaysStoppedAnimation(
                        context.colorScheme.primary,
                      ),
                    ),
                  ),

                  // Percentage Text
                  AnimatedOpacity(
                    opacity: progressValue > 0.1 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Transform.scale(
                      scale: 1.0 + glowValue * 0.05,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${(progressValue * 100).toInt()}',
                            style: AppTextStyles.headingSmall(
                              context,
                            ).copyWith(fontWeight: FontWeight.w800),
                          ),
                          Text(
                            '%',
                            style: AppTextStyles.headingSmall(
                              context,
                            ).copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
