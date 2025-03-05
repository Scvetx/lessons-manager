import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/models/domain/cobject.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/navigation/routes/app_router.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../lessons/domain/models/lesson.dart';
import '../../../lessons/domain/models/state/lessons_list_wrap.dart';
import '../../../lessons/domain/riverpod/lessons_provider.dart';
import '../../../users/students/domain/models/state/students_list_wrap.dart';
import '../../../users/students/domain/models/student.dart';
import '../../../users/students/domain/riverpod/students_provider.dart';
import '../models/course.dart';
import '../models/state/course_wrap.dart';
import 'course_db_repo_provider.dart';

part 'selected_course_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedCourseNotifier extends _$SelectedCourseNotifier {
  @override
  CourseWrap? build() => null;

  /// if [course] is not null, then this lesson will be used in UI
  /// otherwise a new lesson will be created.
  Future<void> setCourse({
    Course? course,
  }) async {
    try {
      final courseId = course?.id;
      if(courseId != null) {
        _setRelatedLessonsValue(courseId);
        _setRelatedStudentsValue(courseId);
      }
      state = course != null ?
          CourseWrap(course) :
          CourseWrap.createCourse();
      
    } catch (e, stack) {
      final errMsg = course != null ? 
        'Failed to open course' :
        'Failed to create course';
      Utils.handleException(e, stack, errMsg);
    }
  }

  /// Save data entered in the course edit form
  Future<void> saveCourse() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      _prepareToSave();
      if (courseData.isNew) {
        await _createRecord(record);
      } else {
        await _updateRecord(record);
      }
      state = null;
      await NavigationService.push(const CoursesRoute());
    // ignore: unused_catch_stack
    } on ValidationException catch (e, stack) {
      // this exception is handled in _prepareToSave
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to save course', 
        snackbarErrMsg: '${l10n.errFailedToSave} ${l10n.courseLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  /// Fetch additional course info and 
  /// navigate to course form screen
  Future<void> onEditRecord() async {
    try {
      await NavigationService.push(const CourseFormRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open course edit form');
    }
  }

  /// Delete the record
  Future<void> onDelete() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final course = record;
      // delete record from remote database
      await ref.read(
        courseDbRepoProvider,
      ).deleteRecord(course);
      NavigationService.forcePop();
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to deactivate course', 
        snackbarErrMsg: '${l10n.errFailedToDelete} ${l10n.courseLabel}',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

// --- related records ---
  /// Navigate to related students list
  void toRelatedStudents() {
    try {
      final course = record;
      NavigationService.push(StudentsRoute(
        courseId: course.id,
      ),);
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to open related students', 
        snackbarErrMsg: l10n.courseErrFailedToOpenRelatedStudents,
      );
    }
  }

  /// Navigate to related lessons list
  void toRelatedLessons() {
    try {
      final course = record;
      NavigationService.push(LessonsRoute(
        courseId: course.id,
      ),);
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to open related lessons', 
        snackbarErrMsg: l10n.courseErrFailedToOpenRelatedLessons,
      );
    }
  }

// --- private ---
  // prepare form data to save in database
  // - validate fields
  // - format and trim values
  void _prepareToSave() {
    try {
      courseData.formWrap.prepareToSave();
    } on ValidationException catch (e, stack) {
      Utils.handleException(e, stack, null,
        snackbarErrMsg: e.toString(), // message is localized in validateFields
      );
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// create record in the remote database
  Future<void> _createRecord(Course record) async {
    // create new record
    await ref.read(
      courseDbRepoProvider,
    ).createRecord(record);
  }

  /// update record in the remote database
  Future<void> _updateRecord(Course record) async {
    final updatedCourse = courseData.formWrap.record;
    final oldCourse = record;
    // update record
    await ref.read(
      courseDbRepoProvider,
    ).updateRecord(updatedCourse, oldCourse);
  }

  /// sets value to provider for lessons related to the course
  void _setRelatedLessonsValue (String courseId) {
    final relatedLessons = 
        ref.read(lessonsNotifierProvider).value
        ?.courseRelatedLessons[courseId];

    ref.read(courseRelatedLessonsNotifierProvider.notifier).init(
      courseId: courseId, 
      lessonsMap: relatedLessons ?? {},
    );
  }

  /// sets value to provider for lessons related to the course
  void _setRelatedStudentsValue (String courseId) {
    final relatedStudents = 
        ref.read(studentsNotifierProvider).value
        ?.courseRelatedStudents[courseId];

    ref.read(courseRelatedStudentsNotifierProvider.notifier).init(
      courseId: courseId, 
      studentsMap: relatedStudents ?? {},
    );
  }

// --- state getters ---
  // ignore: avoid_public_notifier_properties
  CourseWrap get courseData => state!;
  // ignore: avoid_public_notifier_properties
  Course get record => courseData.record;
}


/// Related lessons list provider (when opened from the parent course record)
@Riverpod(keepAlive: true)
class CourseRelatedLessonsNotifier extends _$CourseRelatedLessonsNotifier {
  @override
  AsyncValue<RelatedLessonsListWrap?> build() =>  const AsyncValue.data(null);

  /// initializes the current list of lessons related to the course
  /// and sets a listener to lessons changes
  void init({
    required String courseId, 
    required Map<String, Lesson> lessonsMap,
  }) {
    // set current state
    state = AsyncValue.data(RelatedLessonsListWrap(
      parentId: courseId, 
      recordsMap: lessonsMap,
    ),);
    // subscribe to the students changes
    _initRecordsStreamListener();
  }

  /// Add a listener to students map stream 
  /// this will make sure that related list will be updated if there
  /// are changes in the related lessons
  void _initRecordsStreamListener() {
    // Add a listener to lessons map stream
    ref.listen(lessonsNotifierProvider, (previous, next) {
      next.whenData((data) {
        if (data == null) return;
        final courseId = state.value?.parentId;
        if (courseId != null) {
          state = AsyncValue.data(RelatedLessonsListWrap(
            recordsMap: data.courseRelatedLessons[courseId] ?? {},
            parentId: courseId,
          ),);
        }
      });
    });
  }
}

/// Related students list provider (when opened from the parent course record)
@Riverpod(keepAlive: true)
class CourseRelatedStudentsNotifier extends _$CourseRelatedStudentsNotifier {
  @override
  AsyncValue<RelatedStudentsListWrap?> build() => const AsyncValue.data(null);

  /// initializes the current list of students related to the course
  /// and sets a listener to students changes
  void init({
    required String courseId, 
    required Map<String, Student> studentsMap,
  }) {
    // set current state
    state = AsyncValue.data(RelatedStudentsListWrap(
      parentId: courseId, 
      recordsMap: studentsMap,
    ),);

    // subscribe to the students changes
    _initRecordsStreamListener();
  }

  /// Add a listener to students map stream 
  /// this will make sure that related list will be updated if there
  /// are changes in the related lessons
  void _initRecordsStreamListener() {
    ref.listen(studentsNotifierProvider, (previous, next) {
      next.whenData((data) {
        if (data == null) return;
        final courseId = state.value?.parentId;
        if (courseId != null) {
          state = AsyncValue.data(RelatedStudentsListWrap(
            parentId: courseId,
            recordsMap: data.courseRelatedStudents[courseId] ?? {},
          ),);
        }
      });
    });
  }
}
