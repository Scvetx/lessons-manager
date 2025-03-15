// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unnecessary_lambdas

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workbook/features/users/students/data/models/student_db_data.dart';
import 'package:workbook/features/users/students/data/repository/student_db_service.dart';
import 'package:workbook/features/users/students/domain/models/student.dart';
import 'package:workbook/features/users/teachers/data/models/teacher_db_data.dart';
import 'package:workbook/features/users/teachers/data/repository/teacher_db_service.dart';
import 'package:workbook/features/users/teachers/domain/models/teacher.dart';

// Auth current user mock
class MockUser extends Mock implements User {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  late final MockUser? _mockUser;
  bool _testException = false;


  void setupMock({
    required Type? userType,
    bool testException = false,
  }) {
    _testException = testException;
    setupUser(userType);
    setupFirebaseCoreMocks();
  }

  // sets authorized user data (in auth, firestore)
  void setupUser(Type? userType) {
    _setupAuthUser(userType);
    //_setupFirestoreUsers(userType);
  }

  // Mock Firebase Auth user
  void _setupAuthUser(Type? userType) {
    _mockUser = userType == null ? null : MockUser();
    //Mock Firebase Auth user
    if(_mockUser != null) {
      when(() => _mockUser.uid).thenReturn('current_profile');
      when(() => _mockUser.email).thenReturn(
        userType == null ? null :
        '${userType is Teacher ? 'teacher':'student'}0@example.com',
      );
      when(() => _mockUser.displayName).thenReturn(
        '${userType is Teacher ? 'Teacher':'Student'} 0',
      );
    }
    
    when(() => currentUser).thenReturn(_mockUser);
    when(() => idTokenChanges()).thenAnswer((_) => 
      _testException ? 
        throw Exception('Test exception') : 
        Stream.value(_mockUser).asBroadcastStream(),
    );
  }
}

// Firestore Teacher users mock
class MockTeacherDbService extends Mock implements TeacherDbService {
  final Map <String, Teacher> _teachers = {};

    /// Mock Firestore users
  void setupMock({required Type? userType}) {
    // generates data in [_teachers] and [_students]
    _generateFirestoreUsers(userType);

    // stream firestore users mocked data
    when(() => streamTeachers(any())).thenAnswer(
      (_) => Stream.value(_teachers).asBroadcastStream(),
    );
  }

  /// generate firestore users to use them in tests
  void _generateFirestoreUsers(Type? userType) {
    final createdDate = DateTime.now().toUtc()
                    .subtract(const Duration(days:10));

    for(int i = 1; i < 11; i++) {
      final teacherDbData = _generateTeacher('teacheruid$i', createdDate, i);
      _teachers[teacherDbData.id!] = Teacher.fromDbObject(
        dbData: teacherDbData,
      );
    }
    // current user is teacher
    if(userType == Teacher) {
      final teacherDbData = _generateTeacher('current_profile', createdDate, 0);
      _teachers[teacherDbData.id!] = Teacher.fromDbObject(
        dbData: teacherDbData,
      );
    }
  }

  TeacherDbData _generateTeacher (String uid, DateTime createdDate, int i) =>
    TeacherDbData(
      id: 'teacher$i',
      userId: uid,
      email: 'teacher$i@example.com',
      name: 'Teacher $i',
      createdDate: createdDate,
      modifiedDate: createdDate,
    );
}

// Firestore Student users mock
class MockStudentDbService extends Mock implements StudentDbService {
  final Map <String, Student> _students = {};

  /// Mock Firestore users
  void setupMock({required Type? userType}) {
    // generates data in [_teachers] and [_students]
    _generateFirestoreUsers(userType);

    // stream firestore users mocked data
    when(() => streamStudents(any())).thenAnswer(
      (_) => Stream.value(_students).asBroadcastStream(),
    );
  }

  /// generate firestore users to use them in tests
  void _generateFirestoreUsers(Type? userType) {
    final createdDate = DateTime.now().toUtc()
                    .subtract(const Duration(days:10));

    for(int i = 1; i < 11; i++) {
      final studentDbData = _generateStudent('studentuid$i', createdDate, i);
      _students[studentDbData.id!] = Student.fromDbObject(
        dbData: studentDbData,
      );
    }
    
    // current user is student
    if (userType == Student) {
      final studentDbData = _generateStudent('current_profile', createdDate, 0);
      _students[studentDbData.id!] = Student.fromDbObject(
        dbData: studentDbData,
      );
    }
  }
  StudentDbData _generateStudent (String uid, DateTime createdDate, int i) =>
    StudentDbData(
      id: 'student$i',
      userId: uid,
      email: 'student$i@example.com',
      name: 'Student $i',
      createdDate: createdDate,
      modifiedDate: createdDate,
      teacherId: 'teacher0',
      isActive: true,
      isVerified: true,
      languageLevel: 'A1',
      goal: 'B2',
    );

}