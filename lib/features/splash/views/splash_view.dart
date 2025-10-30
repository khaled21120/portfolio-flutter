import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';
import '../../../core/constants/text_styles.dart';
import '../../../core/helpers/responsive_helper.dart';
import '../widgets/glow_circular_progress.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _glowController;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  bool _animationCompleted = false;

  @override
  void initState() {
    super.initState();

    _initializeAnimations();
    _scheduleNavigation();
  }

  void _initializeAnimations() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 9),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    // Start all animations together
    _progressController.forward();
    _glowController.repeat(reverse: true);
    _fadeController.forward();
  }

  void _scheduleNavigation() {
    Future.delayed(const Duration(seconds: 9), () {
      if (mounted && !_animationCompleted) {
        _animationCompleted = true;
        context.pushReplacement(const ResponsiveLayout());
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _glowController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final cardWidth = isMobile ? context.width * 0.85 : 450.0;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main Content Card
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
                    child: Opacity(opacity: _fadeAnimation.value, child: child),
                  );
                },
                child: Container(
                  width: cardWidth,
                  padding: EdgeInsets.all(32.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(
                          alpha: 0.1,
                        ),
                        blurRadius: 40,
                        offset: const Offset(0, 15),
                      ),
                      BoxShadow(
                        color: context.colorScheme.shadow.withValues(
                          alpha: .05,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: context.colorScheme.outline.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Progress Indicator
                      GlowCircularProgress(
                        progressController: _progressController,
                        glowController: _glowController,
                      ),
                    ],
                  ),
                ),
              ),

              40.height,

              // Bottom Animated Text
              _buildBottomText(context),
            ],
          ).paddingSymmetric(horizontal: isMobile ? 24.w : 0),
        ),
      ),
    );
  }

  Widget _buildBottomText(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: AppTextStyles.headingSmall(context).copyWith(
          color: context.colorScheme.onSurface.withValues(alpha: 0.7),
          fontWeight: FontWeight.w600,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(milliseconds: 550),
          animatedTexts: [
            FadeAnimatedText(
              'Crafting beautiful Flutter applications',
              duration: const Duration(milliseconds: 1600),
            ),
            FadeAnimatedText(
              'Building responsive and modern UIs',
              duration: const Duration(milliseconds: 1600),
            ),
            FadeAnimatedText(
              'Creating exceptional user experiences',
              duration: const Duration(milliseconds: 1600),
            ),
            FadeAnimatedText(
              'Preparing your journey...',
              duration: const Duration(milliseconds: 1600),
            ),
          ],
        ),
      ),
    );
  }
}
