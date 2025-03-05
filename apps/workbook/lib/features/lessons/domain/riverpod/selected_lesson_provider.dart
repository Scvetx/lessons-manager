import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/getit/injection.dart';
import '../../../../core/models/domain/cobject.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../core/navigation/routes/app_router.dart';
import '../../../../core/utils/labels.dart';
import '../../../../core/utils/utils.dart';
import '../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../models/lesson.dart';
import '../models/state/lesson_wrap.dart';
import 'lesson_db_repo_provider.dart';

part 'selected_lesson_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedLessonNotifier extends _$SelectedLessonNotifier {
  
  @override
  LessonWrap? build() => null;

  /// if [lesson] is not null, then this lesson will be used in UI
  /// otherwise a new lesson will be created. The created lesson will be
  ///  linked to [courseId] if this value is not null.
  Future<void> setLesson({
    Lesson? lesson,
    String? courseId,
  }) async {
    try {
      state = lesson != null ?
          LessonWrap(lesson) :
          LessonWrap.createLesson(courseId: courseId);
    } catch (e, stack) {
      final errMsg = lesson != null ? 
        'Failed to open lesson' :
        'Failed to create lesson';
      Utils.handleException(e, stack, errMsg);
    }
  }

// --- actions events ---
  /// Save data entered in the lesson edit form
  Future<void> saveLesson() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      _prepareToSave();
      if (lessonData.isNew) {
        await _createRecord(record);
      } else {
        await _updateRecord(record);
      }
      state = null;
      NavigationService.pop();
    // ignore: unused_catch_stack
    } on ValidationException catch (e, stack) {
      // this exception is handled in _prepareToSave
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to save lesson', 
        snackbarErrMsg: '${l10n.errFailedToSave} ${l10n.lessonLabel}.',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  /// Fetch additional lesson info and 
  /// navigate to lesson form screen
  Future<void> onEditRecord() async {
    try {
      await NavigationService.push(const LessonFormRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open lesson edit form');
    }
  }

  /// Delete the record
  Future<void> onDelete() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final lesson = record;
      /// delete record from remote database
      await ref.read(
        lessonDbRepoProvider,
      ).deleteRecord(lesson);
      NavigationService.forcePop();
    } catch (e, stack) {
      final l10n = getIt<Labels>().l10n;
      Utils.handleException(e, stack, 'Failed to deactivate student', 
        snackbarErrMsg: '${l10n.errFailedToDelete} ${l10n.lessonLabel}',
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

// --- private ---
  // prepare form data to save in database
  // - validate fields
  // - format and trim values
  void _prepareToSave() {
    try {
      lessonData.formWrap.prepareToSave();
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
  Future<void> _createRecord(Lesson record) async {
    // create new record
    await ref.read(
      lessonDbRepoProvider,
    ).createRecord(record);
  }

  /// update record in the remote database
  Future<void> _updateRecord(Lesson record) async {
    final updatedLesson = lessonData.formWrap.record;
    // update record
    await ref.read(
      lessonDbRepoProvider,
    ).updateRecord(updatedLesson);
  }

// --- state getters ---
  // ignore: avoid_public_notifier_properties
  LessonWrap get lessonData => state!;
  // ignore: avoid_public_notifier_properties
  Lesson get record => lessonData.record;
}
