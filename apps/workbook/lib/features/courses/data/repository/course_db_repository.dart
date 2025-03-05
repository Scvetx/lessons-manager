/* functions to process dml/queried courses
*/

import 'package:injectable/injectable.dart';

import '../../../../core/firebase/database/query_filter.dart';
import '../../../lessons/data/repository/lesson_db_repository.dart';
import '../../../users/profile/data/repository/user_repo.dart';
import '../../domain/models/course.dart';
import 'course_db_service.dart';

@lazySingleton
class CourseDbRepository {
  CourseDbRepository(
    this.service,
    this.lessonRepo,
    this.userRepo,
  );
  final CourseDbService service;
  final LessonDbRepository lessonRepo;
  final UserRepository userRepo;

// ----- DML: COURSE -----
  // create 1 course. Returns record's id.
  Future<String> createRecord(Course newCourse) =>
      service.createRecord(newCourse.toJson());

  // update 1 course
  Future updateRecord(Course newCourse, Course oldCourse) async {
    // update course
    await service.updateRecord(newCourse.id!, newCourse.toJson());
  }

  // delete 1 course
  Future deleteRecord(Course course) async {
    await service.deleteRecord(course.id!);
  }

// ----- QUERY: COURSES -----
  // stream courses by filters
  Stream<Map<String, Course>?> streamCourses() async* {
    if (userRepo.isTeacher == null) {
      yield null; // Emit null if the user is logged out
      return;
    }
    
    if (userRepo.isTeacher!) {
      yield* service.streamCourses([
        TeacherIdQueryFilter(userRepo.profileId!),
      ]);
    } else {
      yield* service.streamCourses([
        CoursesIdsListQueryFilter(userRepo.student!.dbData.coursesIds),
      ]);
    }
  }
}
