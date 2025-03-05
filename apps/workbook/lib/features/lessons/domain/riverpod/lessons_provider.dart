import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/navigation/routes/app_router.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../models/lesson.dart';
import '../models/state/lessons_list_wrap.dart';
import 'lesson_db_repo_provider.dart';
import 'selected_lesson_provider.dart';

part 'lessons_provider.g.dart';

@Riverpod(keepAlive: true)
class LessonsNotifier extends _$LessonsNotifier {

  @override
  Stream<LessonsListWrap?> build() {
    if (kDebugMode) print('>>> build lessons notifier provider');
    return _streamLessons();
  }

  /// stream lessons and return LessonsListWrap
  Stream<LessonsListWrap?> _streamLessons() =>
    ref.read(lessonDbRepoProvider).streamLessons().map((recordsMap) =>
        recordsMap == null ? null :
        LessonsListWrap(recordsMap: recordsMap),
    );

  /// Fetch additional lesson info and 
  /// navigate to lesson view screen
  Future onViewRecord({
    required Lesson lesson,
  }) async {
    try {
      await ref.read(
        selectedLessonNotifierProvider.notifier,
      ).setLesson(lesson: lesson);
      await NavigationService.push(const LessonViewRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to view a lesson', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.lessonLabel}.',
      );
    }
  }

  /// Fetch additional lesson info and 
  /// navigate to lesson form screen
  Future<void> onEditRecord({
    required Lesson lesson,
  }) async {
    try {
      await ref.read(
        selectedLessonNotifierProvider.notifier,
      ).setLesson(lesson: lesson);
      await NavigationService.push(const LessonFormRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to edit a lesson', 
        snackbarErrMsg: '${l10n.errFailedToView} ${l10n.lessonLabel}.',
      );
    }
  }

  void onAddRecord({
    String? courseId,
  }) {
    _onAddRecord(courseId: courseId);
  }
  /// Fetch additional lesson info and 
  /// navigate to lesson form screen
  Future<void> _onAddRecord({
    String? courseId,
  }) async {
    try{
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      await ref.read(
        selectedLessonNotifierProvider.notifier,
      ).setLesson(courseId: courseId);
      await NavigationService.push(const LessonFormRoute());
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to add a lesson', 
        snackbarErrMsg: '${l10n.errFailedToAdd} ${l10n.lessonLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }
}