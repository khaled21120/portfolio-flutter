import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/extentions/extentions.dart';
import '../models/project_model.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/helpers/url_helper.dart';

class ProjectItem extends StatefulWidget {
  const ProjectItem({super.key, this.project});
  final ProjectModel? project;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showProjectDialog(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: context.colorScheme.outline.withValues(
                alpha: _isHovered ? 0.3 : 0.1,
              ),
              width: 1.w,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: context.colorScheme.primary.withValues(alpha: 0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                )
              else
                BoxShadow(
                  color: context.colorScheme.shadow.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
            ],
          ),
          child: _buildProjectContent(context),
        ),
      ),
    );
  }

  Widget _buildProjectContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Image
        _buildProjectImage(context),

        // Content
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project Name
              _buildProjectName(context),

              10.height,

              // Description
              Text(
                widget.project?.description ??
                    'Project description will appear here',
                style: AppTextStyles.body(context).copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              20.height,

              // Technologies
              _buildTechnologiesChips(context),

              20.height,

              // Action Buttons
              _buildActionButtons(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectName(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.project?.name ?? 'Project Name',
          style: AppTextStyles.headingSmall(context).copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onSurface,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (widget.project?.featured == true) ...[
          const Spacer(),
          Icon(
            FontAwesomeIcons.solidStar,
            size: 16.sp,
            color: context.colorScheme.primary,
          ),
        ],
      ],
    );
  }

  Widget _buildProjectImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(
              color: context.colorScheme.primary,
              width: 1.5.w,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.1),
              context.colorScheme.primary.withValues(alpha: 0.4),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Project Image
            if (widget.project?.imageUrl?.isNotEmpty == true)
              Center(
                child: CachedNetworkImage(
                  imageUrl: widget.project!.imageUrl!,
                  width: 100.w,
                  placeholder: (context, url) =>
                      _buildImagePlaceholder(context),
                  errorWidget: (context, url, error) =>
                      _buildImagePlaceholder(context),
                  fit: BoxFit.cover,
                ),
              )
            else
              _buildImagePlaceholder(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTechnologiesChips(BuildContext context, {bool showAll = false}) {
    final technologies = widget.project?.technologies ?? [];
    final int maxVisible = 10;

    final displayedTechnologies = showAll
        ? technologies
        : technologies.take(maxVisible).toList();

    final hasMore = technologies.length > maxVisible;

    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        ...displayedTechnologies.map((tech) => _buildTechChip(context, tech)),
        if (!showAll && hasMore)
          Chip(
            label: Text(
              '+${technologies.length - maxVisible} more',
              style: TextStyle(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: context.colorScheme.surface,
            side: BorderSide(
              color: context.colorScheme.primary.withValues(alpha: 0.4),
            )
          ),
      ],
    );
  }

  Widget _buildTechChip(BuildContext context, String technology) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.2),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.code,
            size: 15.sp,
            color: context.colorScheme.primary,
          ),
          10.width,
          Flexible(
            child: Text(
              technology,
              style: AppTextStyles.body(context).copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        // GitHub Button
        if (widget.project?.githubUrl?.isNotEmpty == true)
          Expanded(
            child: _buildActionButton(
              icon: FontAwesomeIcons.github,
              label: 'Code',
              onTap: () => UrlHelper.launchURL(widget.project!.githubUrl!),
              context: context,
              isPrimary: false,
            ),
          ),

        if (widget.project?.githubUrl?.isNotEmpty == true &&
            widget.project?.demoUrl?.isNotEmpty == true)
          8.width,

        // Demo Button
        if (widget.project?.demoUrl?.isNotEmpty == true)
          Expanded(
            child: _buildActionButton(
              icon: FontAwesomeIcons.arrowUpRightFromSquare,
              label: 'Demo',
              onTap: () => UrlHelper.launchURL(widget.project!.demoUrl!),
              context: context,
              isPrimary: true,
            ),
          ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required BuildContext context,
    required bool isPrimary,
  }) {
    return Material(
      color: isPrimary ? context.colorScheme.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(8.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: isPrimary
                ? null
                : Border.all(
                    color: context.colorScheme.outline.withValues(alpha: 0.3),
                    width: 1.w,
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 14.sp,
                color: isPrimary ? Colors.white : context.colorScheme.primary,
              ),
              6.width,
              Text(
                label,
                style: AppTextStyles.headingSmall(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: isPrimary ? Colors.white : context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Center(
      child: Icon(
        FontAwesomeIcons.code,
        size: 40.sp,
        color: context.colorScheme.primary.withValues(alpha: 0.5),
      ),
    );
  }

  Future<void> _showProjectDialog(BuildContext context) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, __, ___) => Center(
        child: SizedBox(
          width: context.isMobile ? context.width * .9 : context.width * .55,
          child: Material(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            child: _buildProjectDialog(context),
          ),
        ),
      ),
      transitionBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildProjectDialog(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: context.colorScheme.surface, width: 1.w),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            _buildDialogHeader(context),

            // Content
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Image
                  _buildProjectImage(context),

                  20.height,

                  // Project Details
                  _buildProjectDetails(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Project Details',
            style: AppTextStyles.headingMedium(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_rounded, size: 20.sp),
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Name
        _buildProjectName(context),

        12.height,

        // Description
        Text(
          widget.project?.description ?? 'No description available',
          style: AppTextStyles.body(
            context,
          ).copyWith(color: context.colorScheme.onSurfaceVariant, height: 1.5),
        ),

        20.height,

        // Technologies
        _buildTechnologiesChips(context, showAll: true),

        20.height,

        // Features
        _buildDialogFeatures(context),

        24.height,

        // Action Buttons
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildDialogFeatures(BuildContext context) {
    final features = widget.project?.features ?? [];

    if (features.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Features',
          style: AppTextStyles.headingSmall(
            context,
          ).copyWith(fontWeight: FontWeight.w600),
        ),

        8.height,

        Column(
          children: features
              .map((feature) => _buildFeatureItem(context, feature))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String feature) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, size: 16.sp, color: context.colorScheme.primary),
          8.width,
          Expanded(
            child: Text(
              feature,
              style: AppTextStyles.body(
                context,
              ).copyWith(color: context.colorScheme.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}
