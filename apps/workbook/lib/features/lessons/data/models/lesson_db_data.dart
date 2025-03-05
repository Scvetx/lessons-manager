// ignore_for_file: recursive_getters, unnecessary_this

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/freezed/timestamp_serializer.dart';
import '../../../../core/models/database/dbobject.dart';

part 'lesson_db_data.freezed.dart';
part 'lesson_db_data.g.dart';

/// Course data from remote database.
/// The fields can be = null only in case if the record is not saved in db yet
@freezed
class LessonDbData with _$LessonDbData implements CObjectDBData {
  @JsonSerializable(includeIfNull: true)
  const factory LessonDbData({
    required String teacherId,
    // -- form fields --
    @Default('') String name,
    @Default('') String description,
    @Default('') languageLevel,
    // ----
    @TimestampSerializer() DateTime? createdDate, // Timestamp from db
    @TimestampSerializer() DateTime? modifiedDate, // Timestamp from db
    String? courseId,
    
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? id,
  }) = _LessonDbData;

  const LessonDbData._();

  factory LessonDbData.fromJson(Map<String, dynamic> json) =>
    _$LessonDbDataFromJson(json);
  
  @override
  Map<String, dynamic> toMap() => this.toJson();
}