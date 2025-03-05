// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_db_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDbDataImpl _$$CourseDbDataImplFromJson(Map<String, dynamic> json) =>
    _$CourseDbDataImpl(
      teacherId: json['teacherId'] as String,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdDate: const TimestampSerializer().fromJson(json['createdDate']),
      modifiedDate: const TimestampSerializer().fromJson(json['modifiedDate']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$CourseDbDataImplToJson(_$CourseDbDataImpl instance) =>
    <String, dynamic>{
      'teacherId': instance.teacherId,
      'name': instance.name,
      'description': instance.description,
      'createdDate': const TimestampSerializer().toJson(instance.createdDate),
      'modifiedDate': const TimestampSerializer().toJson(instance.modifiedDate),
    };
