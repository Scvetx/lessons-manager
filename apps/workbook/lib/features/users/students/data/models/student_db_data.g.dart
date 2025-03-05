// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_db_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentDbDataImpl _$$StudentDbDataImplFromJson(Map<String, dynamic> json) =>
    _$StudentDbDataImpl(
      teacherId: json['teacherId'] as String,
      isActive: json['isActive'] as bool,
      isVerified: json['isVerified'] as bool,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      languageLevel: json['languageLevel'] ?? '',
      goal: json['goal'] ?? '',
      coursesIds: (json['coursesIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      photoUrl: json['photoUrl'] as String?,
      createdDate: const TimestampSerializer().fromJson(json['createdDate']),
      modifiedDate: const TimestampSerializer().fromJson(json['modifiedDate']),
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$StudentDbDataImplToJson(_$StudentDbDataImpl instance) =>
    <String, dynamic>{
      'teacherId': instance.teacherId,
      'isActive': instance.isActive,
      'isVerified': instance.isVerified,
      'email': instance.email,
      'name': instance.name,
      'languageLevel': instance.languageLevel,
      'goal': instance.goal,
      'coursesIds': instance.coursesIds,
      'photoUrl': instance.photoUrl,
      'createdDate': const TimestampSerializer().toJson(instance.createdDate),
      'modifiedDate': const TimestampSerializer().toJson(instance.modifiedDate),
      'userId': instance.userId,
    };
