import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';

class PictureAvatar extends StatelessWidget {
  const PictureAvatar({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final double size = context.isMobile
        ? context.width * 0.5
        : context.isTablet
        ? context.width * 0.35
        : context.width * 0.25;

    return Hero(
      tag: 'profile-avatar',
      child:
          Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      context.colorScheme.primary.withValues(alpha: 0.1),
                      context.colorScheme.primaryContainer.withValues(
                        alpha: 0.3,
                      ),
                    ],
                    center: Alignment.topLeft,
                    radius: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 40,
                      spreadRadius: 5,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer glow effect
                    Container(
                      width: size - 4.w,
                      height: size - 4.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            context.colorScheme.primary.withValues(alpha: 0.1),
                            Colors.transparent,
                          ],
                          stops: const [0.1, 0.8],
                        ),
                      ),
                    ),

                    // Main avatar container
                    Container(
                      width: size - 12.w,
                      height: size - 12.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.3,
                          ),
                          width: 2.w,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.colorScheme.shadow.withValues(
                              alpha: 0.1,
                            ),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipOval(child: _buildProfileImage(context)),
                    ),
                  ],
                ),
              )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .scaleXY(
                begin: 0.99,
                end: 1.01,
                duration: 2.seconds,
                curve: Curves.easeInOut,
              )
              .then(delay: 500.ms),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    if (imageUrl.isNullOrEmpty) return _buildPlaceholder(context);
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,
      placeholder: (context, url) => _buildLoadingShimmer(context),
      errorWidget: (context, url, error) => _buildPlaceholder(context),
      fadeInDuration: const Duration(milliseconds: 800),
      fadeInCurve: Curves.easeOut,
    );
  }

  Widget _buildLoadingShimmer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.surfaceContainerHighest,
            context.colorScheme.surfaceContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 40.w,
          height: 40.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: context.colorScheme.primary.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.surfaceContainerHighest,
            context.colorScheme.surfaceContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.person_rounded,
          size: 80.sp,
          color: context.colorScheme.primary.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
