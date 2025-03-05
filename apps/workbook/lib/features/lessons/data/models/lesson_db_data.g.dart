// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_db_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonDbDataImpl _$$LessonDbDataImplFromJson(Map<String, dynamic> json) =>
    _$LessonDbDataImpl(
      teacherId: json['teacherId'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      languageLevel: json['languageLevel'] ?? '',
      createdDate: const TimestampSerializer().fromJson(json['createdDate']),
      modifiedDate: const TimestampSerializer().fromJson(json['modifiedDate']),
      courseId: json['courseId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$LessonDbDataImplToJson(_$LessonDbDataImpl instance) =>
    <String, dynamic>{
      'teacherId': instance.teacherId,
      'name': instance.name,
      'description': instance.description,
      'languageLevel': instance.languageLevel,
      'createdDate': const TimestampSerializer().toJson(instance.createdDate),
      'modifiedDate': const TimestampSerializer().toJson(instance.modifiedDate),
      'courseId': instance.courseId,
    };
