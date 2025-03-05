/* functions to process dml/queried teachers
*/

import 'package:injectable/injectable.dart';

import '../../../../../core/firebase/database/query_filter.dart';
import '../../domain/models/teacher.dart';
import 'teacher_db_service.dart';

@lazySingleton
class TeacherDbRepository {
  TeacherDbRepository(
    this.service,
  );
  final TeacherDbService service;
  
// ----- DML: TEACHER -----
  // create 1 teacher
  Future<void> createRecord(Teacher newTeacher) =>
      service.createRecord(newTeacher.toJson());
  // update 1 teacher
  Future<void> updateRecord(Teacher newTeacher) => 
    service.updateRecord(newTeacher.id!, newTeacher.toJson());

// ----- QUERY: TEACHERS -----
  // stream current authorized teacher user profile
  Stream<Teacher?> streamTeacherProfile(String userId) {
    final List<QueryFilter> filters = [UserIdQueryFilter(userId)];
    return service.streamTeachers(filters).map(
      (teachers) => teachers.values.isEmpty ? null : teachers.values.first,
    );
  }
}
