// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_db_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonDbData _$LessonDbDataFromJson(Map<String, dynamic> json) {
  return _LessonDbData.fromJson(json);
}

/// @nodoc
mixin _$LessonDbData {
  String get teacherId =>
      throw _privateConstructorUsedError; // -- form fields --
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  dynamic get languageLevel => throw _privateConstructorUsedError; // ----
  @TimestampSerializer()
  DateTime? get createdDate =>
      throw _privateConstructorUsedError; // Timestamp from db
  @TimestampSerializer()
  DateTime? get modifiedDate =>
      throw _privateConstructorUsedError; // Timestamp from db
  String? get courseId =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this LessonDbData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonDbDataCopyWith<LessonDbData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonDbDataCopyWith<$Res> {
  factory $LessonDbDataCopyWith(
          LessonDbData value, $Res Function(LessonDbData) then) =
      _$LessonDbDataCopyWithImpl<$Res, LessonDbData>;
  @useResult
  $Res call(
      {String teacherId,
      String name,
      String description,
      dynamic languageLevel,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? courseId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class _$LessonDbDataCopyWithImpl<$Res, $Val extends LessonDbData>
    implements $LessonDbDataCopyWith<$Res> {
  _$LessonDbDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? description = null,
    Object? languageLevel = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? courseId = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languageLevel: freezed == languageLevel
          ? _value.languageLevel
          : languageLevel // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonDbDataImplCopyWith<$Res>
    implements $LessonDbDataCopyWith<$Res> {
  factory _$$LessonDbDataImplCopyWith(
          _$LessonDbDataImpl value, $Res Function(_$LessonDbDataImpl) then) =
      __$$LessonDbDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teacherId,
      String name,
      String description,
      dynamic languageLevel,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? courseId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class __$$LessonDbDataImplCopyWithImpl<$Res>
    extends _$LessonDbDataCopyWithImpl<$Res, _$LessonDbDataImpl>
    implements _$$LessonDbDataImplCopyWith<$Res> {
  __$$LessonDbDataImplCopyWithImpl(
      _$LessonDbDataImpl _value, $Res Function(_$LessonDbDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LessonDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? description = null,
    Object? languageLevel = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? courseId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$LessonDbDataImpl(
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languageLevel:
          freezed == languageLevel ? _value.languageLevel! : languageLevel,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
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
class _$LessonDbDataImpl extends _LessonDbData {
  const _$LessonDbDataImpl(
      {required this.teacherId,
      this.name = '',
      this.description = '',
      this.languageLevel = '',
      @TimestampSerializer() this.createdDate,
      @TimestampSerializer() this.modifiedDate,
      this.courseId,
      @JsonKey(includeToJson: false) this.id})
      : super._();

  factory _$LessonDbDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonDbDataImplFromJson(json);

  @override
  final String teacherId;
// -- form fields --
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final dynamic languageLevel;
// ----
  @override
  @TimestampSerializer()
  final DateTime? createdDate;
// Timestamp from db
  @override
  @TimestampSerializer()
  final DateTime? modifiedDate;
// Timestamp from db
  @override
  final String? courseId;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String? id;

  @override
  String toString() {
    return 'LessonDbData(teacherId: $teacherId, name: $name, description: $description, languageLevel: $languageLevel, createdDate: $createdDate, modifiedDate: $modifiedDate, courseId: $courseId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonDbDataImpl &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.languageLevel, languageLevel) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      teacherId,
      name,
      description,
      const DeepCollectionEquality().hash(languageLevel),
      createdDate,
      modifiedDate,
      courseId,
      id);

  /// Create a copy of LessonDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonDbDataImplCopyWith<_$LessonDbDataImpl> get copyWith =>
      __$$LessonDbDataImplCopyWithImpl<_$LessonDbDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonDbDataImplToJson(
      this,
    );
  }
}

abstract class _LessonDbData extends LessonDbData {
  const factory _LessonDbData(
      {required final String teacherId,
      final String name,
      final String description,
      final dynamic languageLevel,
      @TimestampSerializer() final DateTime? createdDate,
      @TimestampSerializer() final DateTime? modifiedDate,
      final String? courseId,
      @JsonKey(includeToJson: false) final String? id}) = _$LessonDbDataImpl;
  const _LessonDbData._() : super._();

  factory _LessonDbData.fromJson(Map<String, dynamic> json) =
      _$LessonDbDataImpl.fromJson;

  @override
  String get teacherId; // -- form fields --
  @override
  String get name;
  @override
  String get description;
  @override
  dynamic get languageLevel; // ----
  @override
  @TimestampSerializer()
  DateTime? get createdDate; // Timestamp from db
  @override
  @TimestampSerializer()
  DateTime? get modifiedDate; // Timestamp from db
  @override
  String? get courseId; // ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String? get id;

  /// Create a copy of LessonDbData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonDbDataImplCopyWith<_$LessonDbDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
