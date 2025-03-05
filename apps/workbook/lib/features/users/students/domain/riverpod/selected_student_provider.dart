import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../models/state/student_wrap.dart';
import '../models/student.dart';
import 'student_db_repo_provider.dart';

part 'selected_student_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedStudentNotifier extends _$SelectedStudentNotifier {
  @override
  StudentWrap? build() => null;

  /// if [student] is not null, then this student will be used in UI
  /// otherwise a new student will be created. The created student will be
  ///  linked to [courseId] if this value is not null.
  Future<void> setStudent({
    Student? student,
    String? courseId,
  }) async {
    try {
      state = student != null ?
        StudentWrap(student) :
        StudentWrap.createStudent(
          coursesIds: courseId != null ? [courseId] : null,
        );
    } catch (e, stack) {
      final errMsg = student != null ? 
        'Failed to open student' :
        'Failed to create student';
      Utils.handleException(e, stack, errMsg);
    }
  }

// --- actions events ---
  // prepare form data to save in database
  // - validate fields
  // - format and trim values
  void prepareToSave() {
    try {
      studentData.formWrap.prepareToSave();
    } on ValidationException catch (e, stack) {
      Utils.handleException(e, stack, null,
        snackbarErrMsg: e.toString(), // message is localized in validateFields
      );
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  // Save data entered in the student edit form
  Future<void> saveStudent() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      prepareToSave();
      final updatedStudent = studentData.formWrap.record;
      if(studentData.formWrap.isNew) {
        await ref.read(
          studentDbRepoProvider,
        ).createStudentAndUser(updatedStudent);
      } else {
        await ref.read(
          studentDbRepoProvider,
        ).updateRecord(updatedStudent);
      }
      state = null;
      NavigationService.popUntilRoute(StudentsRoute.name);
    // ignore: unused_catch_stack
    } on ValidationException catch (e, stack) {
      // this exception is handled in _prepareToSave
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to save student', 
        snackbarErrMsg: '${l10n.errFailedToSave} ${l10n.studentLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  void onEditRecord() {
    try {
      final student = record;
      NavigationService.push(StudentFormRoute(student: student));
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open student edit form');
    }
  }

  Future<void> onDeactivateStudent() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final student = record;
      await ref.read(
        studentDbRepoProvider,
      ).deactivateStudent(student);
      await NavigationService.clearRouteAndPush(StudentsRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to deactivate student', 
        snackbarErrMsg: l10n.studentErrDeactivateUserFailed,
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }


// --- state getters ---
  // ignore: avoid_public_notifier_properties
  StudentWrap get studentData => state!;
  // ignore: avoid_public_notifier_properties
  Student get record => studentData.record;
}
