import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/extentions/extentions.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/constants/text_styles.dart';
import '../models/skill_model.dart';

class SkillsGirdItem extends StatefulWidget {
  final SkillModel? skill;

  const SkillsGirdItem({super.key, this.skill});

  @override
  State<SkillsGirdItem> createState() => _SkillsGirdItemState();
}

class _SkillsGirdItemState extends State<SkillsGirdItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool hover) {
    setState(() => _isHovered = hover);
    if (hover) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: _buildSkillCard(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.w,
        ),
        boxShadow: [
          if (_isHovered)
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.15),
              blurRadius: 25,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: context.colorScheme.onSurface.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Skill Icon/Image
          _buildSkillImage(context),

          12.height,

          // Skill Name
          _buildSkillName(context),

          16.height,

          // Progress Bar
          _buildProgressBar(context),

          8.height,

          // Percentage
          _buildPercentageText(context),
        ],
      ),
    );
  }

  Widget _buildSkillImage(BuildContext context) {
    final imageUrl = widget.skill?.imageUrl;

    if (imageUrl == null || imageUrl.isEmpty) {
      return _buildPlaceholderIcon(context);
    }

    return Container(
      width: 60.w,
      height: 60.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.5,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => _buildLoadingShimmer(context),
        errorWidget: (context, url, error) => _buildPlaceholderIcon(context),
        fit: BoxFit.contain,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeInCurve: Curves.easeInOut,
      ),
    );
  }

  Widget _buildLoadingShimmer(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: context.colorScheme.onSurface.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: context.colorScheme.primary.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.w,
        ),
      ),
      child: Icon(
        FontAwesomeIcons.code,
        size: 28.sp,
        color: context.colorScheme.primary.withValues(alpha: 0.7),
      ),
    );
  }

  Widget _buildSkillName(BuildContext context) {
    return Text(
      widget.skill?.name ?? 'Unknown Skill',
      style: AppTextStyles.body(context).copyWith(
        color: context.colorScheme.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        letterSpacing: -0.2,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    final percentage = widget.skill?.percentage ?? 0.0;
    final normalizedPercentage = percentage / 100.0;

    return Column(
      children: [
        LinearPercentIndicator(
          barRadius: Radius.circular(10.r),
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 1500,
          lineHeight: 8.h,
          percent: normalizedPercentage,
          progressColor: _getProgressColor(context, percentage),
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          padding: EdgeInsets.zero,
        ),
        4.height,
      ],
    );
  }

  Color _getProgressColor(BuildContext context, double percentage) {
    if (percentage >= 80) {
      return Colors.green.shade400;
    } else if (percentage >= 60) {
      return context.colorScheme.primary;
    } else if (percentage >= 40) {
      return Colors.orange.shade400;
    } else {
      return Colors.amber.shade600;
    }
  }

  Widget _buildPercentageText(BuildContext context) {
    final percentage = widget.skill?.percentage ?? 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(
          alpha: _isHovered ? 0.1 : 0.05,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        '$percentage%',
        style: AppTextStyles.body(context).copyWith(
          fontSize: 14.sp,
          color: context.colorScheme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
        ),
      ),
    );
  }
}
