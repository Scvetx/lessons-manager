import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/freezed/timestamp_serializer.dart';
import '../../../../../core/models/database/dbobject.dart';

part 'course_db_data.freezed.dart';
part 'course_db_data.g.dart';


/// Course data from remote database.
/// The fields can be = null only in case if the record is not saved in db yet
@freezed
class CourseDbData with _$CourseDbData implements CObjectDBData {
  @JsonSerializable(includeIfNull: true)
  const factory CourseDbData({
    required String teacherId,
    // -- form fields --
    @Default('') String name,
    @Default('') String description,
    // ----
    @TimestampSerializer() DateTime? createdDate, // Timestamp from db
    @TimestampSerializer() DateTime? modifiedDate, // Timestamp from db
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? id,
  }) = _CourseDbData;

  factory CourseDbData.fromJson(Map<String, dynamic> json) =>
    _$CourseDbDataFromJson(json);

  const CourseDbData._();
  
  // --- override DBObject methods to use in firebase_collections ---
  @override
  Map<String, dynamic> toMap() => toJson();
}