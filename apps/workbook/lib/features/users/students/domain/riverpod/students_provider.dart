import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../models/state/students_list_wrap.dart';
import '../models/student.dart';
import 'selected_student_provider.dart';
import 'student_db_repo_provider.dart';

part 'students_provider.g.dart';

@Riverpod(keepAlive: true)
class StudentsNotifier extends _$StudentsNotifier {

  @override
  Stream<StudentsListWrap?> build() {
    if (kDebugMode) print('>>> build students notifier provider');
    return _streamCourses();
  }

  /// stream lessons and return LessonsListWrap
  Stream<StudentsListWrap?> _streamCourses() =>
    ref.read(studentDbRepoProvider).streamStudents().map((recordsMap) =>
       recordsMap == null ? null :
       StudentsListWrap(recordsMap: recordsMap),
    );


  // Fetch additional student info and 
  // navigate to student view screen
  Future onViewRecord({
    required Student student,
  }) async {
    try {
      await ref.read(
        selectedStudentNotifierProvider.notifier,
      ).setStudent(student: student);
      await NavigationService.push(StudentViewRoute(student: student));
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to view a student', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.studentLabel}.',
      );
    }
  }

  // Fetch additional student info and 
  // navigate to student form screen
  Future<void> onEditRecord({
    required Student student,
  }) async {
    try {
      await ref.read(
        selectedStudentNotifierProvider.notifier,
      ).setStudent(student: student);
      await NavigationService.push(StudentFormRoute(student: student));
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to edit a student', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.studentLabel}.',
      );
    }
  }

  // Fetch additional student info and 
  // navigate to student form screen
  Future<void> onAddRecord({
    String? courseId,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      await ref.read(
        selectedStudentNotifierProvider.notifier,
      ).setStudent(courseId: courseId);
      await NavigationService.push(StudentFormRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to add a student', 
        snackbarErrMsg: '${l10n.errFailedToAdd} ${l10n.studentLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }
}