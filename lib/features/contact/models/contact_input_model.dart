import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_input_model.g.dart';

@JsonSerializable()
class ContactInputModel {
  final String name;
  final String email;
  final String message;

  ContactInputModel({
    required this.name,
    required this.email,
    required this.message,
  });

  factory ContactInputModel.fromJson(json) => _$ContactInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInputModelToJson(this);
}
