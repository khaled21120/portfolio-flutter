import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/supabase_constants.dart';
import '../../../core/networking/supabase_service.dart';
import '../models/project_model.dart';
import 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit(this._service) : super(const ProjectsState.initial());
  final SupabaseService _service;

  void fetchProjects() async {
    emit(const ProjectsState.loading());
    final res = await _service.getData(table: SupabaseConstants.projects);
    res.fold(
      (l) => emit(ProjectsState.error(l.errMsg)),
      (r) => emit(
        ProjectsState.loaded(
          r.map((project) => ProjectModel.fromJson(project)).toList(),
        ),
      ),
    );
  }
}
