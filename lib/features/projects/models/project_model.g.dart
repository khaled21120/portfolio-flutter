// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  githubUrl: json['githubUrl'] as String?,
  imageUrl: json['imageUrl'] as String?,
  technologies: (json['technologies'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  featured: json['featured'] as bool?,
  demoUrl: json['demoUrl'] as String?,
  features: (json['features'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'githubUrl': instance.githubUrl,
      'imageUrl': instance.imageUrl,
      'technologies': instance.technologies,
      'featured': instance.featured,
      'demoUrl': instance.demoUrl,
      'features': instance.features,
    };
