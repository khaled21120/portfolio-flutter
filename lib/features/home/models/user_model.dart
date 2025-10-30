import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? description;
  @JsonKey(name: 'githubURL')
  String? githubUrl;
  @JsonKey(name: 'linkedInURL')
  String? linkedInUrl;
  @JsonKey(name: 'resumeURL')
  String? resumeUrl;
  @JsonKey(name: 'pictureURL')
  String? pictureUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.description,
    this.githubUrl,
    this.linkedInUrl,
    this.resumeUrl,
    this.pictureUrl,
  });

  factory UserModel.fromJson(json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
