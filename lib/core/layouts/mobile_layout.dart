import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extentions/extentions.dart';
import '../shared/custom_appbar.dart';
import '../../features/contact/views/contact_section.dart';
import '../../features/projects/views/project_section.dart';

import '../../features/about/views/about_section.dart';
import '../../features/home/views/home_view.dart';
import '../../features/skills/views/skills_view.dart';
import '../shared/footer.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      drawer: CustomAppbar(
        onHomeTap: () => _scrollTo(_homeKey),
        onAboutTap: () => _scrollTo(_aboutKey),
        onSkillsTap: () => _scrollTo(_skillsKey),
        onProjectsTap: () => _scrollTo(_projectsKey),
        onContactTap: () => _scrollTo(_contactKey),
      ).buildDrawer(context),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          spacing: 40.h,
          children: [
            SizedBox(key: _homeKey, child: const HomeSection()),
            20.height,

            SizedBox(key: _aboutKey, child: const AboutSection()),
            20.height,

            SizedBox(key: _skillsKey, child: const SkillsSection()),
            20.height,

            SizedBox(key: _projectsKey, child: const ProjectSection()),
            20.height,

            SizedBox(key: _contactKey, child: const ContactSection()),
            20.height,
            const Footer(),
          ],
        ),
      ),
    );
  }
}
