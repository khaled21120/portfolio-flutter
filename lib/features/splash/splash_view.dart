// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/text_styles.dart';
import 'package:my_portfolio/core/extentions/extentions.dart';
import 'package:my_portfolio/core/helpers/responsive_helper.dart';

class ProfessionalSplashScreen extends StatefulWidget {
  const ProfessionalSplashScreen({super.key});

  @override
  State<ProfessionalSplashScreen> createState() =>
      _ProfessionalSplashScreenState();
}

class _ProfessionalSplashScreenState extends State<ProfessionalSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.pushReplacement(const ResponsiveLayout());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.background,
              context.colorScheme.background.withValues(alpha: .95),
              context.colorScheme.background,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo with scale animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.code_rounded,
                    size: 50,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),

              40.height,

              // Name with slide and opacity animation
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Column(
                    children: [
                      Text(
                        'Khaled Gamal',
                        style: AppTextStyles.headingMedium(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.colorScheme.onSurface,
                        ),
                      ),

                      12.height,

                      // Title with subtle background
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Flutter Developer • Mobile App Specialist',
                          style: AppTextStyles.body(context).copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      32.height,

                      // Minimal loading bar - now full width with constraints
                      Container(
                        width: double.infinity, // Full width
                        constraints: const BoxConstraints(
                          maxWidth: 200, // Maximum width
                        ),
                        height: 2,
                        decoration: BoxDecoration(
                          color: context.colorScheme.outline.withValues(
                            alpha: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, child) {
                            return Stack(
                              children: [
                                Container(
                                  width:
                                      double.infinity, // Full width background
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.outline
                                        .withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                                Container(
                                  width:
                                      (MediaQuery.of(context).size.width *
                                          0.5) *
                                      _progressAnimation.value,
                                  constraints: BoxConstraints(
                                    maxWidth: 200 * _progressAnimation.value,
                                  ),
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
