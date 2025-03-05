import '../../../../../../core/models/domain/state/cobject_list_wrap.dart';
import '../student.dart';

/// wrapper for all students list and map
class StudentsListWrap extends CObjectsListWrap {
  StudentsListWrap({
    required this.recordsMap, 
  }) :
    records = recordsMap.values.toList() {
      _setRelatedRecordsMaps ();
    }

  /// map student.id => student
  @override
  final Map<String, Student> recordsMap;
  /// map of all students
  @override
  final List<Student> records;

  //map of course id => list of related students
  late final Map<String, Map<String, Student>> courseRelatedStudents;

  void _setRelatedRecordsMaps () {
    courseRelatedStudents = {};
    for(final student in records) {
      final studentId = student.dbData.id!;
      final coursesIds = student.dbData.coursesIds;
      if (coursesIds.isEmpty) continue; // student doesn't attend any courses
      for(final courseId in student.dbData.coursesIds) {
        if(!courseRelatedStudents.containsKey(courseId)) {
          courseRelatedStudents[courseId] = {};
        }
        courseRelatedStudents[courseId]![studentId] = student;
      }
    }
  }
}

/// wrapper for a list of students related to 
/// some parent record (for ex. to parent Course record)
class RelatedStudentsListWrap extends StudentsListWrap{
  RelatedStudentsListWrap({
    required this.parentId,
    required super.recordsMap,
  });
  /// parent record id
  final String parentId;
}
