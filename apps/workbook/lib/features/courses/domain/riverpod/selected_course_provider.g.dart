// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_course_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedCourseNotifierHash() =>
    r'6dccd627bb1ade9e57a80d1ad454119dc5efd9cb';

/// See also [SelectedCourseNotifier].
@ProviderFor(SelectedCourseNotifier)
final selectedCourseNotifierProvider =
    NotifierProvider<SelectedCourseNotifier, CourseWrap?>.internal(
  SelectedCourseNotifier.new,
  name: r'selectedCourseNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCourseNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCourseNotifier = Notifier<CourseWrap?>;
String _$courseRelatedLessonsNotifierHash() =>
    r'1724f28bcdff750ba8ea4471c83f6ca8acf14789';

/// Related lessons list provider (when opened from the parent course record)
///
/// Copied from [CourseRelatedLessonsNotifier].
@ProviderFor(CourseRelatedLessonsNotifier)
final courseRelatedLessonsNotifierProvider = NotifierProvider<
    CourseRelatedLessonsNotifier, AsyncValue<RelatedLessonsListWrap?>>.internal(
  CourseRelatedLessonsNotifier.new,
  name: r'courseRelatedLessonsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$courseRelatedLessonsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CourseRelatedLessonsNotifier
    = Notifier<AsyncValue<RelatedLessonsListWrap?>>;
String _$courseRelatedStudentsNotifierHash() =>
    r'd66efba98f2f5fda3fa599b96b85302543d262f6';

/// Related students list provider (when opened from the parent course record)
///
/// Copied from [CourseRelatedStudentsNotifier].
@ProviderFor(CourseRelatedStudentsNotifier)
final courseRelatedStudentsNotifierProvider = NotifierProvider<
    CourseRelatedStudentsNotifier,
    AsyncValue<RelatedStudentsListWrap?>>.internal(
  CourseRelatedStudentsNotifier.new,
  name: r'courseRelatedStudentsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$courseRelatedStudentsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CourseRelatedStudentsNotifier
    = Notifier<AsyncValue<RelatedStudentsListWrap?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
