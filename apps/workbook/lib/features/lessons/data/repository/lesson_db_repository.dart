/* functions to process dml/queried lessons
*/

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/database/query_filter.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/models/lesson.dart';
import 'lesson_db_service.dart';

@lazySingleton
class LessonDbRepository {
  LessonDbRepository(
    this.service,
    this.userRepo,
  );
  final LessonDbService service;
  final UserRepository userRepo;

// ----- DML: LESSON -----
  /// create 1 lesson. Returns record's id.
  Future<String> createRecord(Lesson lesson) =>
      service.createRecord(lesson.toJson());

  /// update 1 lesson
  Future<void> updateRecord(Lesson lesson) async =>
      service.updateRecord(lesson.id!, lesson.toJson());

  /// delete 1 lesson
  Future<void> deleteRecord(Lesson lesson) async =>
      service.deleteRecord(lesson.id!);

// ----- QUERY: LESSONS -----
  /// stream all lessons related to the teacher
  Stream<Map<String, Lesson>?> streamLessons() async* {
    if (userRepo.isTeacher == null) {
      yield null; // Emit null if the user is logged out
      return;
    }

    if (userRepo.isTeacher!) {
      yield* service.streamLessons([
        TeacherIdQueryFilter(userRepo.profileId!),
      ]);
    } else {
      yield* service.streamLessons([
        CoursesIdsListQueryFilter(userRepo.student!.dbData.coursesIds),
      ]);
    }
  }
}
