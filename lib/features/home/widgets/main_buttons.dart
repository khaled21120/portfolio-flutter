import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/extentions/extentions.dart';

import '../../../core/helpers/url_helper.dart';
import '../../../core/shared/custom_button.dart';
import '../models/user_model.dart';

class MainButtons extends StatelessWidget {
  const MainButtons({super.key, this.user});
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: context.isMobile ? WrapAlignment.center : WrapAlignment.start,
      runAlignment: context.isMobile
          ? WrapAlignment.center
          : WrapAlignment.start,
      runSpacing: 10.h,
      spacing: 10.w,
      direction: context.isDesktop ? Axis.horizontal : Axis.vertical,
      children: [
        CustomButton(
          text: 'View Projects',
          onTap: () => UrlHelper.launchURL(user?.githubUrl ?? ''),
          icon: FontAwesomeIcons.github,
          textColor: Colors.white,
          color: context.colorScheme.primary,
        ),
        CustomButton(
          text: 'Contact Me',
          onTap: () => UrlHelper.launchURL('mailto:${user?.email}'),
          // ignore: deprecated_member_use
          icon: FontAwesomeIcons.envelope,
        ),
        CustomButton(
          text: 'Download CV',
          onTap: () => UrlHelper.launchURL(user?.resumeUrl ?? ''),
          icon: FontAwesomeIcons.download,
        ),
      ],
    );
  }
}
