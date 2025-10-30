// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  imageUrl: json['imageURL'] as String?,
  percentage: (json['percentage'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageURL': instance.imageUrl,
      'percentage': instance.percentage,
    };
