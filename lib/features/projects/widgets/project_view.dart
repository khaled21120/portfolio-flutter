import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/extentions/extentions.dart';
import '../cubit/projects_cubit.dart';
import 'project_item.dart';

import '../../../core/shared/custom_error_widget.dart';
import '../cubit/projects_state.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error) => ErrorWidgetCustom(
          message: error,
          onRetry: () => context.read<ProjectsCubit>().fetchProjects(),
        ),
        loaded: (projects) => Wrap(
          alignment: WrapAlignment.start,
          spacing: 20.w,
          runSpacing: 15.w,
          children: projects.map((project) {
            return ConstrainedBox(
              constraints:  BoxConstraints(
                maxWidth: context.isMobile ? context.width * .9 : 350,
                minWidth: context.isMobile ? context.width * .9 : 350,
              ),
              child: ProjectItem(project: project),
            );
          }).toList(),
        ),
      ),
    );
  }
}
