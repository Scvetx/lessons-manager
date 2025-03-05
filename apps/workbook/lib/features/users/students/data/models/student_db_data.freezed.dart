// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_db_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentDbData _$StudentDbDataFromJson(Map<String, dynamic> json) {
  return _StudentDbData.fromJson(json);
}

/// @nodoc
mixin _$StudentDbData {
  String get teacherId => throw _privateConstructorUsedError;

  /// if student is active then showed in the lists
  /// if deactivated then disappears from the lists and can only be found
  /// in the list of deactivated students
  bool get isActive => throw _privateConstructorUsedError;

  /// if student is verified it means that the studend has logged in
  /// to the app at least once, after the teacher provided access to the app
  bool get isVerified =>
      throw _privateConstructorUsedError; // -- form fields --
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get languageLevel => throw _privateConstructorUsedError;
  dynamic get goal => throw _privateConstructorUsedError;
  List<String> get coursesIds => throw _privateConstructorUsedError; // ----
  String? get photoUrl => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime? get createdDate =>
      throw _privateConstructorUsedError; // Timestamp from db
  @TimestampSerializer()
  DateTime? get modifiedDate =>
      throw _privateConstructorUsedError; // Timestamp from db
  String? get userId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this StudentDbData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentDbDataCopyWith<StudentDbData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentDbDataCopyWith<$Res> {
  factory $StudentDbDataCopyWith(
          StudentDbData value, $Res Function(StudentDbData) then) =
      _$StudentDbDataCopyWithImpl<$Res, StudentDbData>;
  @useResult
  $Res call(
      {String teacherId,
      bool isActive,
      bool isVerified,
      String email,
      String name,
      dynamic languageLevel,
      dynamic goal,
      List<String> coursesIds,
      String? photoUrl,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? userId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class _$StudentDbDataCopyWithImpl<$Res, $Val extends StudentDbData>
    implements $StudentDbDataCopyWith<$Res> {
  _$StudentDbDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? email = null,
    Object? name = null,
    Object? languageLevel = freezed,
    Object? goal = freezed,
    Object? coursesIds = null,
    Object? photoUrl = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      languageLevel: freezed == languageLevel
          ? _value.languageLevel
          : languageLevel // ignore: cast_nullable_to_non_nullable
              as dynamic,
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      coursesIds: null == coursesIds
          ? _value.coursesIds
          : coursesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentDbDataImplCopyWith<$Res>
    implements $StudentDbDataCopyWith<$Res> {
  factory _$$StudentDbDataImplCopyWith(
          _$StudentDbDataImpl value, $Res Function(_$StudentDbDataImpl) then) =
      __$$StudentDbDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teacherId,
      bool isActive,
      bool isVerified,
      String email,
      String name,
      dynamic languageLevel,
      dynamic goal,
      List<String> coursesIds,
      String? photoUrl,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? userId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class __$$StudentDbDataImplCopyWithImpl<$Res>
    extends _$StudentDbDataCopyWithImpl<$Res, _$StudentDbDataImpl>
    implements _$$StudentDbDataImplCopyWith<$Res> {
  __$$StudentDbDataImplCopyWithImpl(
      _$StudentDbDataImpl _value, $Res Function(_$StudentDbDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudentDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? email = null,
    Object? name = null,
    Object? languageLevel = freezed,
    Object? goal = freezed,
    Object? coursesIds = null,
    Object? photoUrl = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$StudentDbDataImpl(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      languageLevel:
          freezed == languageLevel ? _value.languageLevel! : languageLevel,
      goal: freezed == goal ? _value.goal! : goal,
      coursesIds: null == coursesIds
          ? _value._coursesIds
          : coursesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: true)
class _$StudentDbDataImpl extends _StudentDbData {
  const _$StudentDbDataImpl(
      {required this.teacherId,
      required this.isActive,
      required this.isVerified,
      this.email = '',
      this.name = '',
      this.languageLevel = '',
      this.goal = '',
      final List<String> coursesIds = const [],
      this.photoUrl,
      @TimestampSerializer() this.createdDate,
      @TimestampSerializer() this.modifiedDate,
      this.userId,
      @JsonKey(includeToJson: false) this.id})
      : _coursesIds = coursesIds,
        super._();

  factory _$StudentDbDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentDbDataImplFromJson(json);

  @override
  final String teacherId;

  /// if student is active then showed in the lists
  /// if deactivated then disappears from the lists and can only be found
  /// in the list of deactivated students
  @override
  final bool isActive;

  /// if student is verified it means that the studend has logged in
  /// to the app at least once, after the teacher provided access to the app
  @override
  final bool isVerified;
// -- form fields --
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final dynamic languageLevel;
  @override
  @JsonKey()
  final dynamic goal;
  final List<String> _coursesIds;
  @override
  @JsonKey()
  List<String> get coursesIds {
    if (_coursesIds is EqualUnmodifiableListView) return _coursesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coursesIds);
  }

// ----
  @override
  final String? photoUrl;
  @override
  @TimestampSerializer()
  final DateTime? createdDate;
// Timestamp from db
  @override
  @TimestampSerializer()
  final DateTime? modifiedDate;
// Timestamp from db
  @override
  final String? userId;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String? id;

  @override
  String toString() {
    return 'StudentDbData(teacherId: $teacherId, isActive: $isActive, isVerified: $isVerified, email: $email, name: $name, languageLevel: $languageLevel, goal: $goal, coursesIds: $coursesIds, photoUrl: $photoUrl, createdDate: $createdDate, modifiedDate: $modifiedDate, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentDbDataImpl &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other.languageLevel, languageLevel) &&
            const DeepCollectionEquality().equals(other.goal, goal) &&
            const DeepCollectionEquality()
                .equals(other._coursesIds, _coursesIds) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      teacherId,
      isActive,
      isVerified,
      email,
      name,
      const DeepCollectionEquality().hash(languageLevel),
      const DeepCollectionEquality().hash(goal),
      const DeepCollectionEquality().hash(_coursesIds),
      photoUrl,
      createdDate,
      modifiedDate,
      userId,
      id);

  /// Create a copy of StudentDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentDbDataImplCopyWith<_$StudentDbDataImpl> get copyWith =>
      __$$StudentDbDataImplCopyWithImpl<_$StudentDbDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentDbDataImplToJson(
      this,
    );
  }
}

abstract class _StudentDbData extends StudentDbData {
  const factory _StudentDbData(
      {required final String teacherId,
      required final bool isActive,
      required final bool isVerified,
      final String email,
      final String name,
      final dynamic languageLevel,
      final dynamic goal,
      final List<String> coursesIds,
      final String? photoUrl,
      @TimestampSerializer() final DateTime? createdDate,
      @TimestampSerializer() final DateTime? modifiedDate,
      final String? userId,
      @JsonKey(includeToJson: false) final String? id}) = _$StudentDbDataImpl;
  const _StudentDbData._() : super._();

  factory _StudentDbData.fromJson(Map<String, dynamic> json) =
      _$StudentDbDataImpl.fromJson;

  @override
  String get teacherId;

  /// if student is active then showed in the lists
  /// if deactivated then disappears from the lists and can only be found
  /// in the list of deactivated students
  @override
  bool get isActive;

  /// if student is verified it means that the studend has logged in
  /// to the app at least once, after the teacher provided access to the app
  @override
  bool get isVerified; // -- form fields --
  @override
  String get email;
  @override
  String get name;
  @override
  dynamic get languageLevel;
  @override
  dynamic get goal;
  @override
  List<String> get coursesIds; // ----
  @override
  String? get photoUrl;
  @override
  @TimestampSerializer()
  DateTime? get createdDate; // Timestamp from db
  @override
  @TimestampSerializer()
  DateTime? get modifiedDate; // Timestamp from db
  @override
  String? get userId; // ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String? get id;

  /// Create a copy of StudentDbData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentDbDataImplCopyWith<_$StudentDbDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
