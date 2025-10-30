import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/skill_model.dart';

part 'skills_state.freezed.dart';

@freezed
class SkillsState with _$SkillsState {
  const factory SkillsState.initial() = _Initial;

  const factory SkillsState.skillsLoading() = _SkillsLoading;

  const factory SkillsState.skillsLoaded(List<SkillModel> list) = _SkillsLoaded;

  const factory SkillsState.skillsError(String error) = _SkillsError;
}
