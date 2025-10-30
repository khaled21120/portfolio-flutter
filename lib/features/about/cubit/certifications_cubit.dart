import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/certifcations_model.dart';

import '../../../core/networking/supabase_constants.dart';
import '../../../core/networking/supabase_service.dart';
import 'certifications_state.dart';

class CertificationsCubit extends Cubit<CertificationsState> {
  CertificationsCubit(this._service)
    : super(const CertificationsState.initial());
  final SupabaseService _service;

  void fetchCertifications() async {
    emit(const CertificationsState.certificationsLoading());
    final res = await _service.getData(table: SupabaseConstants.certifications);
    res.fold(
      (l) => emit(CertificationsState.certificationsError(l.errMsg)),
      (r) => emit(
        CertificationsState.certificationsLoaded(
          r.map((cer) => CertificationModel.fromJson(cer)).toList(),
        ),
      ),
    );
  }
}
