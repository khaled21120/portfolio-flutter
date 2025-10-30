import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          spacing: 10,
          runSpacing: 10,
          children: projects.map((project) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 350,
                minWidth: 300,
              ),
              child: ProjectItem(project: project),
            );
          }).toList(),
        ),
      ),
    );
  }
}
