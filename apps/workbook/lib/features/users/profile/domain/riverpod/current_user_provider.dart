import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/navigation/constants/default_routes.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../courses/domain/riverpod/courses_provider.dart';
import '../../../../disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../../lessons/domain/riverpod/lessons_provider.dart';
import '../../../students/domain/models/state/student_wrap.dart';
import '../../../students/domain/models/student.dart';
import '../../../students/domain/riverpod/students_provider.dart';
import '../../../teachers/domain/models/state/teacher_wrap.dart';
import '../../../teachers/domain/models/teacher.dart';
import '../models/profile.dart';
import '../models/state/profile_wrap.dart';
import 'user_repo_provider.dart';

part 'current_user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  StreamSubscription<Profile?>? _profileSubscription;
  @override
  ProfileWrap? build() => null;

// ----- init state -----

  /// init user repository and sets value to the current state
  Future<void> init() async {
    if (kDebugMode) print('>>> init current user');

    final userRepo = ref.read(userRepoProvider);
    // init profile repo stream (also sets value to userRepo.profile)
    await userRepo.init(refreshUserState: _refreshUserData);
    // set current state value
    final currentProfile = userRepo.profile;
    _setCurrentUser(currentProfile);

    // listen to profile changes to update state value if new profile is emitted
    _profileSubscription = userRepo.profileStream.listen(_setCurrentUser);

    // dispose userRepo stream and cancel subscription to it
    ref.onDispose(() {
      _profileSubscription?.cancel();
      userRepo.dispose();
      if (kDebugMode) debugPrint('>>> disposed current user');
    });
  }

  /// set current state
  void _setCurrentUser(Profile? newProfile) {
    if (kDebugMode) print('>> set current user: $newProfile');
    state = _profileToWrap(newProfile);
  }

  /// set ProfileWrap of the certain type
  ProfileWrap? _profileToWrap(Profile? newProfile) =>
      newProfile is Teacher ? TeacherWrap(newProfile) :
      newProfile is Student ? StudentWrap(newProfile) :
      null;


// ----- actions events -----

  // prepare form data to save in database
  // - validate fields
  // - format and trim values
  void prepareToSave() {
    try {
      if(_profileData == null) return;
      _profileData!.formWrap.prepareToSave();
    } on ValidationException catch (e, stack) {
      Utils.handleException(e, stack, null,
        snackbarErrMsg: e.toString(), // message is localized in validateFields
      );
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// Save new profile data
  Future<void> saveProfile({
    required String password,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      if(_profileData == null) return;
      prepareToSave();

      final userRepo = ref.read(userRepoProvider);

      final updatedProfile = _profileData!.formWrap.record;
      final oldProfile = _profileData!.formWrap.oldRecord;

      await userRepo.updateUserProfile(updatedProfile, oldProfile,
        password: password,
      );
      await NavigationService.clearRouteAndPush(const ProfileViewRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to save user profile', 
        snackbarErrMsg: e.toString(),
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  /// Updates the generated Firebase auth password to that one which student 
  /// enters when logs in for the first time
  Future<void> updateStudentPasswordOnFirstLogin({
    required String newPassword,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      await ref.read(userRepoProvider)
      .updateStudentPasswordOnFirstLogin(newPassword: newPassword);

      // go to home screen
      await NavigationService.replaceAll(DefaultRoutes().homeRoute);
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to update password', 
        snackbarErrMsg: e.toString(),
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  /// Updates password in Firebase auth
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      final userRepo = ref.read(userRepoProvider);
      await userRepo.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      NavigationService.pop();
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to update password', 
        snackbarErrMsg: e.toString(),
      );
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

  /// handle edit record button pressed
  Future<void> onEditRecord() async {
    try {
      await NavigationService.push(const ProfileFormRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open profile edit form');
    }
  }

  /// handle edit password button pressed
  Future<void> onEditPassword() async {
    try {
      await NavigationService.push(const PasswordEditRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open profile edit form');
    }
  }

  /// handle edit photo button pressed
  Future<void> onEditPhoto() async {
    try {
      await NavigationService.push(const PhotoEditRoute());
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open profile edit form');
    } 
  }

  /// handle logout button pressed
  Future<void> logOut() async {
    try {
      ref.read(disableScreen.notifier).state = true; // Lock the screen
      await ref.read(userRepoProvider).logOut();
    } catch (e, stack) {
      Utils.handleException(e, stack, 'Failed to open profile edit form');
    } finally {
      ref.read(disableScreen.notifier).state = false; // Unlock the screen
    }
  }

// ----- refresh user data (used on login/logout) -----

  /// additional logic to clear up all the data related to the user when 
  /// user logs out. This includes clearing up all the providers which are
  /// related to the user, such as records streams from Firebase
  void _refreshUserData() => _clearRiverpodProviders();

  /// Clear all providers which depend on the current user
  void _clearRiverpodProviders() {
    ref.invalidate(coursesNotifierProvider);
    ref.invalidate(lessonsNotifierProvider);
    ref.invalidate(studentsNotifierProvider);
    if (kDebugMode) print('>>> destroyed riverpod providers');
  }


// ----- state getters -----
  ProfileWrap? get _profileData => state;
  //Profile? get _record => _profileData?.record;
}
