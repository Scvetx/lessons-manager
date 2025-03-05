import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/freezed/timestamp_serializer.dart';
import '../../../profile/data/models/profile_db_object.dart';

part 'teacher_db_data.freezed.dart';
part 'teacher_db_data.g.dart';

/// Course data from remote database.
/// The fields can be = null only in case if the record is not saved in db yet
@freezed
class TeacherDbData with _$TeacherDbData implements ProfileDBData {
  @JsonSerializable(includeIfNull: true)
  const factory TeacherDbData({
    // -- form fields --
    @Default('')  String email, 
    @Default('') String name,
    // ----
    String? photoUrl,
    @TimestampSerializer() DateTime? createdDate, // Timestamp from db
    @TimestampSerializer() DateTime? modifiedDate, // Timestamp from db
    String? userId,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? id,
  }) = _TeacherDbData;

  factory TeacherDbData.fromJson(Map<String, dynamic> json) =>
    _$TeacherDbDataFromJson(json);

  const TeacherDbData._();

  // --- override DBObject methods to use in firebase_collections ---
  @override
  Map<String, dynamic> toMap() => toJson();
}