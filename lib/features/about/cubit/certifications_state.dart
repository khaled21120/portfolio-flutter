import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/certifcations_model.dart';

part 'certifications_state.freezed.dart';

@freezed
class CertificationsState with _$CertificationsState {
  const factory CertificationsState.initial() = _Initial;

  const factory CertificationsState.certificationsLoading() =
      _CertificationsLoading;

  const factory CertificationsState.certificationsLoaded(
    List<CertificationModel> list,
  ) = _CertificationsLoaded;

  const factory CertificationsState.certificationsError(String error) =
      _CertificationsError;
}
