import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_model.g.dart';

@JsonSerializable()
class SkillModel {
  String? id;
  String? name;
  @JsonKey(name: 'imageURL')
  String? imageUrl;
  double? percentage;

  SkillModel({this.id, this.name, this.imageUrl, this.percentage});

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
}
