import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/supabase_constants.dart';
import '../../../../core/networking/supabase_service.dart';
import '../models/skill_model.dart';
import 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit(this._service) : super(const SkillsState.initial());
  final SupabaseService _service;

  void fetchSkills() async {
    emit(const SkillsState.skillsLoading());
    final res = await _service.getData(table: SupabaseConstants.skills);
    res.fold(
      (l) => emit(SkillsState.skillsError(l.errMsg)),
      (r) => emit(
        SkillsState.skillsLoaded(
          r.map((skill) => SkillModel.fromJson(skill)).toList(),
        ),
      ),
    );
  }
}
