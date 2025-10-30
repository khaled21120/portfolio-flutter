import 'package:freezed_annotation/freezed_annotation.dart';

part 'certifcations_model.g.dart';

@JsonSerializable()
class CertificationModel {
  String? id;
  String? name;
  String? imageUrl;
  String? description;
  String? issuer;
  String? date;
  String? certificateUrl;

  CertificationModel({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.issuer,
    this.date,
    this.certificateUrl,
  });

  factory CertificationModel.fromJson(Map<String, dynamic> json) =>
      _$CertificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationModelToJson(this);
}
