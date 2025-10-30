// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certifcations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificationModel _$CertificationModelFromJson(Map<String, dynamic> json) =>
    CertificationModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
      issuer: json['issuer'] as String?,
      date: json['date'] as String?,
      certificateUrl: json['certificateUrl'] as String?,
    );

Map<String, dynamic> _$CertificationModelToJson(CertificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'issuer': instance.issuer,
      'date': instance.date,
      'certificateUrl': instance.certificateUrl,
    };
