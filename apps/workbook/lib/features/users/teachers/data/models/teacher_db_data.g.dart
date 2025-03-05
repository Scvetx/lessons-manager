// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_db_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherDbDataImpl _$$TeacherDbDataImplFromJson(Map<String, dynamic> json) =>
    _$TeacherDbDataImpl(
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      photoUrl: json['photoUrl'] as String?,
      createdDate: const TimestampSerializer().fromJson(json['createdDate']),
      modifiedDate: const TimestampSerializer().fromJson(json['modifiedDate']),
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$TeacherDbDataImplToJson(_$TeacherDbDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'createdDate': const TimestampSerializer().toJson(instance.createdDate),
      'modifiedDate': const TimestampSerializer().toJson(instance.modifiedDate),
      'userId': instance.userId,
    };
