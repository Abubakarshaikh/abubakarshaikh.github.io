// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      title: json['title'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String?,
      siteUrl: json['siteUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'technologies': instance.technologies,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'siteUrl': instance.siteUrl,
      'githubUrl': instance.githubUrl,
    };
