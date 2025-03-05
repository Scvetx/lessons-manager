import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/navigation/constants/default_routes.dart';
import '../../../../../core/navigation/navigation_service.dart';
import '../../../../../core/navigation/routes/app_router.dart';
import '../../../auth/data/repository/firebase_auth_repo.dart';
import '../../../students/data/repository/student_db_repository.dart';
import '../../../students/domain/models/student.dart';
import '../../../teachers/data/repository/teacher_db_repository.dart';
import '../../../teachers/domain/models/teacher.dart';
import '../../domain/models/profile.dart';

@lazySingleton
class UserRepository {  
  UserRepository(
    this.teacherRepo,
    this.studentRepo,
    this.authRepo,
  );
  final TeacherDbRepository teacherRepo;
  final StudentDbRepository studentRepo;
  final FirebaseAuthRepository authRepo;

  final StreamController<Profile?> _controller = StreamController<Profile?>();
  StreamSubscription<Profile?>? _dbSubscription;
  StreamSubscription<User?>? _authSubscription;

  Stream<Profile?> get profileStream => _controller.stream;
  Student? student; 
  Teacher? teacher;
  
  bool? get isTeacher => teacher != null ? true : 
                        student != null ? false :
                        null;

  Profile? get profile => teacher ?? student;
  String? get profileId => teacher?.id ?? student?.id;

// ----- init state -----
  /// Create stream of current user profile
  Future<void> init({
    /// a function which will clean all riverpod states related to the current
    required Function refreshUserState,
  }) async {
    String? currentUserId = authRepo.userId;
    if(currentUserId == null) {
      _controller.add(null);
    } else {
      await _streamUserProfile(currentUserId);
    }
    
    _authSubscription = authRepo.streamUserLoggedOut().listen(
      (newUserValue) async {
    // -- user logged out --
      if (newUserValue == null) {
        if (kDebugMode) print('>>> user is null -> logout');
        currentUserId = null;
        await _onUserLoggedOut(
          refreshUserState: refreshUserState,
        );
    // -- user logged in --
      } else {
        if (kDebugMode) print('>>> user is logged in ');
        // if user logged in right after opening the app then at this moment
        // currentUserId will not be null because it's set in the beginning 
        // of init() method
        if(currentUserId == null) { 
          // handle user data if user logged out -> logged in the same session
          currentUserId = newUserValue.uid;
          await _onUserLoggedIn(newUserValue.uid, 
            refreshUserState: refreshUserState,
          );
        }
      }
    });
  }

  /// Create stream of current user profile
  Future<void> _streamUserProfile(String userId) async {
    if (kDebugMode) print('>>> stream new user data ');
    // Get teacher repository
    final teacherStream = teacherRepo.streamTeacherProfile(userId);
    teacher = await teacherStream.first;
    
    // If the current user is a teacher - stream the teacher profile
    if (teacher != null) {
      _dbSubscription = teacherStream.listen(
        (teacherProfile) {
          teacher = teacherProfile;
          _controller.add(teacher);
        }
      );
      return;
    } 
    // Get student repository
    final studentStream = studentRepo.streamStudentProfile(userId);
    student = await studentStream.first;
    
    // If the current user is a student - stream the student profile
    if(student != null) {
      _dbSubscription = studentStream.listen(
        (studentProfile) {
          student = studentProfile;
          _controller.add(student);
        }
      );
      return;
    }
  }


// ----- handle user logged in/out -----

  /// handle Fb Auth event -> user logged in
  Future<void> _onUserLoggedIn(String userId, {
    /// a function which will clean all riverpod states related to the current
    required Function refreshUserState,
  }) async {
    refreshUserState();
    await _streamUserProfile(userId);

    // go to change password if it's the first student's login
    if (student != null && !student!.dbData.isVerified) {
      await NavigationService.push(const FirstLoginRoute());
      // go to home page otherwise
    } else {
      await NavigationService.replaceAll(DefaultRoutes().homeRoute);
    }
  }

  /// handle Fb Auth event -> user logged out
  Future<void>  _onUserLoggedOut({
    /// a function which will clean all riverpod states related to the current
    required Function refreshUserState,
  }) async {
    refreshUserState();
    await _clearUserProfile();

    if(!NavigationService.containsRoute(LoginRoute.name)) {
      await NavigationService.replaceAll(DefaultRoutes().loginRoute);
    }
  }

  /// Clears current Profile data (teacher/student)
  /// Cancels firebase Stream subscription for Profile(Teacher/Student)
  Future<void> _clearUserProfile() async {
    teacher = null;
    student = null;
    _controller.add(null); // emit null value to currentUserNotifier
    await _dbSubscription?.cancel();
  }


// ----- handle users creation from app ui -----
  /// Creates a new user in Fb Auth
  /// [email] - email of the new user
  /// [password] - password of the new user
  Future<void> createUserWithEmailAndPassword ({
    required String email, 
    required String password,
  }) => authRepo.createUserWithoutSigningIn(email, password);

  /// updates password which student enters when logged in for the first time
  /// sets isVerified = true on the student record
  Future<void> updateStudentPasswordOnFirstLogin({
    required String newPassword,
  }) async {
    // update user password
    await authRepo.updatePassword(newPassword);
    // update student as verified
    await studentRepo.verifyStudent(student!);
  }


// ----- actions events -----

  /// Updates Firebase Auth user if needed 
  /// and user's profile (users collection if firestore).
  /// updates Firebase Auth User if any of the optional params has value:
  /// - [updatedName] will be set as username in Firebase Auth.
  /// - [updatedEmail] will be set as email in Firebase Auth
  /// - needs [currentPassword] to reauthenticate if [updatedEmail] != null
  Future<void> updateUserProfile(
    Profile updatedProfile,
    Profile oldProfile, {
    String? password, 
  }) async {
    final updatedName = updatedProfile.formData.name.value;
    final updatedEmail = updatedProfile.formData.email.value;

    final nameChanged = updatedName != oldProfile.dbData.name;
    final emailChanged = updatedEmail != oldProfile.dbData.email;

    if (nameChanged) updatedProfile.formData.validateName();
    if (emailChanged) updatedProfile.formData.validateEmail();


    if(nameChanged) {
      await authRepo.updateUserName(updatedName);
    }
    if(emailChanged) {
      await authRepo.reauthenticateUser(password!);
      await authRepo.updateUserEmail(updatedEmail);
    } 

    if (updatedProfile is Teacher) {
      await teacherRepo.updateRecord(updatedProfile);
    } else if(updatedProfile is Student) {
      await studentRepo.updateRecord(updatedProfile);
    }
  }

  /// update user's photo
  Future<void> updateUserPhoto(Profile updatedProfile) async {
    await authRepo.updateUserPhotoURL(updatedProfile.formData.photo.value!);
    
    if (updatedProfile is Teacher) {
      await teacherRepo.updateRecord(updatedProfile);
    } else if(updatedProfile is Student) {
      await studentRepo.updateRecord(updatedProfile);
    }
  }

  /// Updates password in Fb Auth
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await authRepo.reauthenticateUser(oldPassword);
    await authRepo.updatePassword(newPassword);
  }

  /// Handle user pressed logout
  Future<void> logOut () async {
    await authRepo.logOut();
  }


// ----- dispose profile stream -----
  /// dispose current repo: close stream, cancel subscriptions
  /// called when app is closed
  void dispose() {
    if (kDebugMode) print('>> dispose profile repo');
    _controller.close();
    _authSubscription?.cancel();
    _dbSubscription?.cancel();
  }
}