import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/networking/supabase_service.dart';

import '../../../core/networking/supabase_constants.dart';
import '../models/user_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._service) : super(const HomeState.initial());
  final SupabaseService _service;
  void fetchUser() async {
    emit(const HomeState.loading());
    final res = await _service.getSingleData(
      table: SupabaseConstants.user,
      id: AppConstants.uid,
    );
    res.fold(
      (l) => emit(HomeState.error(l.errMsg)),
      (r) => emit(HomeState.loaded(UserModel.fromJson(r))),
    );
  }
}
