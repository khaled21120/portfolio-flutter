
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';
@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.sent() = _Sent;
  const factory ContactState.error(String error) = _Error;
}
