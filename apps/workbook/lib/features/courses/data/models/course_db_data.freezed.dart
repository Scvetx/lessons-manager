// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_db_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseDbData _$CourseDbDataFromJson(Map<String, dynamic> json) {
  return _CourseDbData.fromJson(json);
}

/// @nodoc
mixin _$CourseDbData {
  String get teacherId =>
      throw _privateConstructorUsedError; // -- form fields --
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError; // ----
  @TimestampSerializer()
  DateTime? get createdDate =>
      throw _privateConstructorUsedError; // Timestamp from db
  @TimestampSerializer()
  DateTime? get modifiedDate =>
      throw _privateConstructorUsedError; // Timestamp from db
// ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this CourseDbData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseDbDataCopyWith<CourseDbData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDbDataCopyWith<$Res> {
  factory $CourseDbDataCopyWith(
          CourseDbData value, $Res Function(CourseDbData) then) =
      _$CourseDbDataCopyWithImpl<$Res, CourseDbData>;
  @useResult
  $Res call(
      {String teacherId,
      String name,
      String description,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class _$CourseDbDataCopyWithImpl<$Res, $Val extends CourseDbData>
    implements $CourseDbDataCopyWith<$Res> {
  _$CourseDbDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? description = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
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
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseDbDataImplCopyWith<$Res>
    implements $CourseDbDataCopyWith<$Res> {
  factory _$$CourseDbDataImplCopyWith(
          _$CourseDbDataImpl value, $Res Function(_$CourseDbDataImpl) then) =
      __$$CourseDbDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String teacherId,
      String name,
      String description,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class __$$CourseDbDataImplCopyWithImpl<$Res>
    extends _$CourseDbDataCopyWithImpl<$Res, _$CourseDbDataImpl>
    implements _$$CourseDbDataImplCopyWith<$Res> {
  __$$CourseDbDataImplCopyWithImpl(
      _$CourseDbDataImpl _value, $Res Function(_$CourseDbDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CourseDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? name = null,
    Object? description = null,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_$CourseDbDataImpl(
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
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: true)
class _$CourseDbDataImpl extends _CourseDbData {
  const _$CourseDbDataImpl(
      {required this.teacherId,
      this.name = '',
      this.description = '',
      @TimestampSerializer() this.createdDate,
      @TimestampSerializer() this.modifiedDate,
      @JsonKey(includeToJson: false) this.id})
      : super._();

  factory _$CourseDbDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDbDataImplFromJson(json);

  @override
  final String teacherId;
// -- form fields --
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
// ----
  @override
  @TimestampSerializer()
  final DateTime? createdDate;
// Timestamp from db
  @override
  @TimestampSerializer()
  final DateTime? modifiedDate;
// Timestamp from db
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String? id;

  @override
  String toString() {
    return 'CourseDbData(teacherId: $teacherId, name: $name, description: $description, createdDate: $createdDate, modifiedDate: $modifiedDate, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDbDataImpl &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, teacherId, name, description, createdDate, modifiedDate, id);

  /// Create a copy of CourseDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDbDataImplCopyWith<_$CourseDbDataImpl> get copyWith =>
      __$$CourseDbDataImplCopyWithImpl<_$CourseDbDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDbDataImplToJson(
      this,
    );
  }
}

abstract class _CourseDbData extends CourseDbData {
  const factory _CourseDbData(
      {required final String teacherId,
      final String name,
      final String description,
      @TimestampSerializer() final DateTime? createdDate,
      @TimestampSerializer() final DateTime? modifiedDate,
      @JsonKey(includeToJson: false) final String? id}) = _$CourseDbDataImpl;
  const _CourseDbData._() : super._();

  factory _CourseDbData.fromJson(Map<String, dynamic> json) =
      _$CourseDbDataImpl.fromJson;

  @override
  String get teacherId; // -- form fields --
  @override
  String get name;
  @override
  String get description; // ----
  @override
  @TimestampSerializer()
  DateTime? get createdDate; // Timestamp from db
  @override
  @TimestampSerializer()
  DateTime? get modifiedDate; // Timestamp from db
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String? get id;

  /// Create a copy of CourseDbData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseDbDataImplCopyWith<_$CourseDbDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
