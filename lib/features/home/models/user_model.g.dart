// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  description: json['description'] as String?,
  githubUrl: json['githubURL'] as String?,
  linkedInUrl: json['linkedInURL'] as String?,
  resumeUrl: json['resumeURL'] as String?,
  pictureUrl: json['pictureURL'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'description': instance.description,
  'githubURL': instance.githubUrl,
  'linkedInURL': instance.linkedInUrl,
  'resumeURL': instance.resumeUrl,
  'pictureURL': instance.pictureUrl,
};
