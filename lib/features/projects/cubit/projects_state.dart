import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/project_model.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState.initial() = _Initial;
  const factory ProjectsState.loading() = _Loading;
  const factory ProjectsState.loaded(List<ProjectModel> projects) = _Loaded;
  const factory ProjectsState.error(String error) = _Error;
}
