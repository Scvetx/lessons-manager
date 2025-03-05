/* functions to process dml/queried students
*/

import 'package:injectable/injectable.dart';

import '../../../../../core/firebase/database/query_filter.dart';
import '../../../../../core/getit/injection.dart';
import '../../../../../core/utils/labels.dart';
import '../../../auth/data/repository/firebase_auth_repo.dart';
import '../../../profile/data/repository/user_repo.dart';
import '../../domain/models/student.dart';
import 'student_db_service.dart';

@lazySingleton
class StudentDbRepository {
  StudentDbRepository(
    this.service,
  );
  final StudentDbService service;

// ----- DML: STUDENT -----
  // create a new user and 1 student related to the user
  Future<void> createStudentAndUser(Student newStudent) async {
    // create user
    final newUser = await getIt<FirebaseAuthRepository>()
        .createUserWithoutSigningIn(
          newStudent.formData.email.value, 
          newStudent.firstLoginPassword!,
        );

    if (newUser != null) {
      // set userId to student data
      final dbStudent = newStudent.copy(userId: newUser.uid);
      // save student to db
      await service.createRecord(dbStudent.toJson());
    } else {
      final l10n = getIt<Labels>().l10n;
      // ignore: lines_longer_than_80_chars
      throw Exception('${l10n.userErrFailedToCreateUser} ${l10n.labelPleaseTryAgain}');
    }
  }

  // update 1 student
  Future<void> updateRecord(Student newStudent) async {
    // update student
    await service.updateRecord(newStudent.id!, newStudent.toJson());
  }

  // set isVerified = true to
  Future<void> verifyStudent(Student student) async {
    final newStudent = student.copy(isVerified: true);
    await updateRecord(newStudent);
  }

  // set isActive to false to remove the student from ui lists in the app
  Future<void> deactivateStudent(Student student) async {
    // we don't delete student: only deactivate it
    final newStudent = student.copy(isActive: false);
    await updateRecord(newStudent);
  }

// ----- QUERY: STUDENTS -----
  // stream current authorized student user profile
  Stream<Student?> streamStudentProfile(String userId) {
    final filters = [UserIdQueryFilter(userId)];
    return service.streamStudents(filters).map(
      (students) => students.values.isEmpty ? null : students.values.first,
    );
  }

  // stream students by filters
  Stream<Map<String, Student>?> streamStudents() async* {
    final userRepo = getIt<UserRepository>();
    if (userRepo.isTeacher == null) {
      yield null; // Emit null if the user is logged out
      return;
    }
    if (userRepo.isTeacher!) {
      yield* service.streamStudents([
          TeacherIdQueryFilter(userRepo.profileId!),
          IsActiveQueryFilter(true),
      ]);
    } else {
      // empty stream is returned if the current user is a student
      // students don't have access to other students list now,
      // so this case won't happen.
      // To give students access to other students records, add 
      // the corresponding service method instead of the empty stream.
      yield {};
    }
  }
}
