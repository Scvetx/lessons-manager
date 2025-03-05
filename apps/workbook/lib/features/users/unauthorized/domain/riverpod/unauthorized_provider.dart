import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../auth/domain/riverpod/auth_repo_provider.dart';
import '../../../profile/domain/models/profile.dart';
import '../../../profile/domain/models/state/profile_wrap.dart';
import '../../../teachers/domain/models/state/teacher_wrap.dart';
import '../../../teachers/domain/models/teacher.dart';
import '../../../teachers/domain/riverpod/teacher_db_repo_provider.dart';

part 'unauthorized_provider.g.dart';

@Riverpod(keepAlive: true)
class UnauthorizedNotifier extends _$UnauthorizedNotifier {
  @override
  ProfileWrap? build() => null;


// ========= REGISTER ==========
  void toRegisterScreen() {
    _createTeacherWrap();
    NavigationService.push(const RegistrationRoute());
  }

  /// Save user in Fb Auth and save Teacher record in Firestore
  Future<void> registerTeacherAccount ({
    required String password,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final authRepo = ref.read(authRepoProvider);
      final teacherRepo = ref.read(teacherDbRepoProvider);

      _prepareToSave();

      // create a user in Firebase
      await authRepo.auth.createUserWithEmailAndPassword(
        email: record!.formData.email.value,
        password: password,
      );
      final dbTeacher = record!.copy(
        userId: authRepo.userId,
      );
      try {
        await Future.wait(
          [
            // set user's name in Fb Auth
            authRepo.updateUserName(record!.formData.name.value),
            // create record in Firestore
            teacherRepo.createRecord(dbTeacher as Teacher),
          ],
          eagerError: true,
        );
      } catch(e) {
        try {
          await authRepo.user?.delete();
        // ignore: empty_catches
        } catch (e) {}
      }

      _clearState();
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to login', 
        snackbarErrMsg: e.toString(),
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  void _createTeacherWrap() {
    state = TeacherWrap.createTeacher();
  }
  void _clearState() {
    state = null;
  }

  // prepare form data to save in database
  // - validate fields
  // - format and trim values
  void _prepareToSave() {
    try {
      profileData?.formWrap.prepareToSave();
    } on ValidationException catch (e, stack) {
      Utils.handleException(e, stack, null,
        snackbarErrMsg: e.toString(), // message is localized in validateFields
      );
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

// ========= LOGIN ==========
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final authRepo = ref.read(authRepoProvider);

      // sign in to firebase
      await authRepo.auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to login', 
        snackbarErrMsg: e.toString(),
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

// --- state getters ---
  // ignore: avoid_public_notifier_properties
  ProfileWrap? get profileData => state;
  // ignore: avoid_public_notifier_properties
  Profile? get record => profileData?.record;
}