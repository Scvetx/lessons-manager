import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/freezed/timestamp_serializer.dart';
import '../../../profile/data/models/profile_db_object.dart';

part 'student_db_data.freezed.dart';
part 'student_db_data.g.dart';

/// Course data from remote database.
/// The fields can be = null only in case if the record is not saved in db yet
@freezed
class StudentDbData with _$StudentDbData implements ProfileDBData {
  @JsonSerializable(includeIfNull: true)
  const factory StudentDbData({
    required String teacherId,
    /// if student is active then showed in the lists
    /// if deactivated then disappears from the lists and can only be found
    /// in the list of deactivated students
    required bool isActive,
    /// if student is verified it means that the studend has logged in 
    /// to the app at least once, after the teacher provided access to the app
    required bool isVerified,
    // -- form fields --
    @Default('')  String email, 
    @Default('') String name,
    @Default('') languageLevel, 
    @Default('') goal, 
    @Default([]) List<String> coursesIds,
    // ----
    String? photoUrl,
    @TimestampSerializer() DateTime? createdDate, // Timestamp from db
    @TimestampSerializer() DateTime? modifiedDate, // Timestamp from db
    String? userId,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? id,
  }) = _StudentDbData;

  factory StudentDbData.fromJson(Map<String, dynamic> json) =>
    _$StudentDbDataFromJson(json);

  const StudentDbData._();

  // --- override DBObject methods to use in firebase_collections ---
  @override
  Map<String, dynamic> toMap() => toJson();
}