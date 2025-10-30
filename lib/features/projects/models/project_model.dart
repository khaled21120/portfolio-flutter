import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel {
  String? id;
  String? name;
  String? description;
  String? githubUrl;
  String? imageUrl;
  List<String>? technologies;
  bool? featured;
  String? demoUrl;
  List<String>? features;

  ProjectModel({
    this.id,
    this.name,
    this.description,
    this.githubUrl,
    this.imageUrl,
    this.technologies,
    this.featured,
    this.demoUrl,
    this.features,
  });

  factory ProjectModel.fromJson(json) => _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
