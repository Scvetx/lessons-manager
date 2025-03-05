import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/navigation/routes/app_router.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../models/course.dart';
import '../models/state/courses_list_wrap.dart';
import 'course_db_repo_provider.dart';
import 'selected_course_provider.dart';

part 'courses_provider.g.dart';

@Riverpod(keepAlive: true)
class CoursesNotifier extends _$CoursesNotifier {

  @override
  Stream<CoursesListWrap?> build() {
    if (kDebugMode) print('>>> build courses notifier provider');
    return _streamCourses();
  }

  /// stream lessons and return LessonsListWrap
  Stream<CoursesListWrap?> _streamCourses() =>
    ref.read(courseDbRepoProvider).streamCourses().map((recordsMap) =>
       recordsMap == null ? null :
       CoursesListWrap(recordsMap: recordsMap),
    );
  

  /// Fetch additional course info and 
  /// navigate to course view screen
  Future onViewRecord({
    required Course course,
  }) async {
    try {
      await ref.read(
        selectedCourseNotifierProvider.notifier,
      ).setCourse(course: course);
      await NavigationService.push(const CourseViewRoute());
     } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to view a course', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.courseLabel}.',
      );
    }
  }

  /// Fetch additional course info and 
  /// navigate to course form screen
  Future<void> onEditRecord({
    required Course course,
  }) async {
    try {
      await ref.read(
        selectedCourseNotifierProvider.notifier,
      ).setCourse(course: course);
      await NavigationService.push(const CourseFormRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to open course form', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.courseLabel}.',
      );
    }
  }

  /// Fetch additional course info and 
  /// navigate to course form screen
  Future<void> onAddRecord() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      await ref.read(
        selectedCourseNotifierProvider.notifier,
      ).setCourse();
      await NavigationService.push(const CourseFormRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to add a course', 
        snackbarErrMsg: '${l10n.errFailedToAdd} ${l10n.courseLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }
}