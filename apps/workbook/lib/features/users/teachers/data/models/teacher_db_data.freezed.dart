// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_db_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherDbData _$TeacherDbDataFromJson(Map<String, dynamic> json) {
  return _TeacherDbData.fromJson(json);
}

/// @nodoc
mixin _$TeacherDbData {
// -- form fields --
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // ----
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

  /// Serializes this TeacherDbData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherDbDataCopyWith<TeacherDbData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherDbDataCopyWith<$Res> {
  factory $TeacherDbDataCopyWith(
          TeacherDbData value, $Res Function(TeacherDbData) then) =
      _$TeacherDbDataCopyWithImpl<$Res, TeacherDbData>;
  @useResult
  $Res call(
      {String email,
      String name,
      String? photoUrl,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? userId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class _$TeacherDbDataCopyWithImpl<$Res, $Val extends TeacherDbData>
    implements $TeacherDbDataCopyWith<$Res> {
  _$TeacherDbDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? photoUrl = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$TeacherDbDataImplCopyWith<$Res>
    implements $TeacherDbDataCopyWith<$Res> {
  factory _$$TeacherDbDataImplCopyWith(
          _$TeacherDbDataImpl value, $Res Function(_$TeacherDbDataImpl) then) =
      __$$TeacherDbDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      String? photoUrl,
      @TimestampSerializer() DateTime? createdDate,
      @TimestampSerializer() DateTime? modifiedDate,
      String? userId,
      @JsonKey(includeToJson: false) String? id});
}

/// @nodoc
class __$$TeacherDbDataImplCopyWithImpl<$Res>
    extends _$TeacherDbDataCopyWithImpl<$Res, _$TeacherDbDataImpl>
    implements _$$TeacherDbDataImplCopyWith<$Res> {
  __$$TeacherDbDataImplCopyWithImpl(
      _$TeacherDbDataImpl _value, $Res Function(_$TeacherDbDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TeacherDbData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? photoUrl = freezed,
    Object? createdDate = freezed,
    Object? modifiedDate = freezed,
    Object? userId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$TeacherDbDataImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$TeacherDbDataImpl extends _TeacherDbData {
  const _$TeacherDbDataImpl(
      {this.email = '',
      this.name = '',
      this.photoUrl,
      @TimestampSerializer() this.createdDate,
      @TimestampSerializer() this.modifiedDate,
      this.userId,
      @JsonKey(includeToJson: false) this.id})
      : super._();

  factory _$TeacherDbDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherDbDataImplFromJson(json);

// -- form fields --
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String name;
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
    return 'TeacherDbData(email: $email, name: $name, photoUrl: $photoUrl, createdDate: $createdDate, modifiedDate: $modifiedDate, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherDbDataImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
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
  int get hashCode => Object.hash(runtimeType, email, name, photoUrl,
      createdDate, modifiedDate, userId, id);

  /// Create a copy of TeacherDbData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherDbDataImplCopyWith<_$TeacherDbDataImpl> get copyWith =>
      __$$TeacherDbDataImplCopyWithImpl<_$TeacherDbDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherDbDataImplToJson(
      this,
    );
  }
}

abstract class _TeacherDbData extends TeacherDbData {
  const factory _TeacherDbData(
      {final String email,
      final String name,
      final String? photoUrl,
      @TimestampSerializer() final DateTime? createdDate,
      @TimestampSerializer() final DateTime? modifiedDate,
      final String? userId,
      @JsonKey(includeToJson: false) final String? id}) = _$TeacherDbDataImpl;
  const _TeacherDbData._() : super._();

  factory _TeacherDbData.fromJson(Map<String, dynamic> json) =
      _$TeacherDbDataImpl.fromJson;

// -- form fields --
  @override
  String get email;
  @override
  String get name; // ----
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

  /// Create a copy of TeacherDbData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherDbDataImplCopyWith<_$TeacherDbDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
