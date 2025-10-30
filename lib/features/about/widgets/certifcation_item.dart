import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extentions/extentions.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/helpers/url_helper.dart';
import '../models/certifcations_model.dart';

class CertificationItem extends StatefulWidget {
  final CertificationModel certification;

  const CertificationItem({super.key, required this.certification});

  @override
  State<CertificationItem> createState() => _CertificationItemState();
}

class _CertificationItemState extends State<CertificationItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlHelper.launchURL(widget.certification.certificateUrl ?? ''),
        child: _buildCertificationCard(context),
      ),
    );
  }

  Widget _buildCertificationCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      transform: Matrix4.identity()
        ..scale(_isHovered ? 1.02 : 1.0)
        ..translate(0, _isHovered ? -6 : 0),
      padding: EdgeInsets.all(24.w),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: _isHovered
              ? context.colorScheme.primary
              : context.colorScheme.outline.withValues(alpha:0.1),
          width: 1.5.w,
        ),
        boxShadow: [
          if (_isHovered)
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha:0.15),
              blurRadius: 25,
              offset: const Offset(0, 8),
            )
          else
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha:0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with name and date
          _buildHeader(context),
          
          16.height,
          
          // Issuer
          _buildIssuer(context),
          
          12.height,
          
          // Description
          _buildDescription(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Certification Name
        Expanded(
          child: Text(
            widget.certification.name ?? 'Certification Name',
            style: AppTextStyles.headingMedium(context).copyWith(
              fontWeight: FontWeight.w700,
              color: context.colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        12.width,
        
        // Date Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _isHovered 
                ? context.colorScheme.primary 
                : context.colorScheme.primary.withValues(alpha:0.9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            widget.certification.date ?? 'Date',
            style: AppTextStyles.body(context).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIssuer(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.business_center_rounded,
          size: 16.sp,
          color: context.colorScheme.primary,
        ),
        8.width,
        Expanded(
          child: Text(
            widget.certification.issuer ?? 'Issuer',
            style: AppTextStyles.body(context).copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      widget.certification.description ?? 'No description available',
      style: AppTextStyles.body(context).copyWith(
        color: context.colorScheme.onSurfaceVariant,
        height: 1.5,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}