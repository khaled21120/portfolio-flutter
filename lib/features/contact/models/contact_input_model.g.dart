// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInputModel _$ContactInputModelFromJson(Map<String, dynamic> json) =>
    ContactInputModel(
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ContactInputModelToJson(ContactInputModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
    };
