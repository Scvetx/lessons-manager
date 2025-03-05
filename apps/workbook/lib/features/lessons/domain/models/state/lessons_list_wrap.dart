import '../../../../../core/models/domain/state/cobject_list_wrap.dart';
import '../lesson.dart';

/// wrapper for all lessons list and map
class LessonsListWrap extends CObjectsListWrap {
  LessonsListWrap({
    required this.recordsMap, 
  }) :
    records = recordsMap.values.toList() {
      _setRelatedRecordsMaps();
    }

  /// map of all lessons
  @override
  final Map<String, Lesson> recordsMap;
  /// map lesson.id => lesson
  @override
  final List<Lesson> records;

  //map of course id => list of related lessons
  late final Map<String, Map<String, Lesson>> courseRelatedLessons;

  void _setRelatedRecordsMaps () {
    courseRelatedLessons = {};
    for(final lesson in records) {
      final lessonId = lesson.dbData.id!;
      final courseId = lesson.dbData.courseId;
      if (courseId == null) continue; // lesson doesn't have a parent course
      if(!courseRelatedLessons.containsKey(courseId)) {
        courseRelatedLessons[courseId] = {};
      }
      courseRelatedLessons[courseId]![lessonId] = lesson;
    }
  }
}

/// wrapper for a list of lessons related to 
/// some parent record (for ex. to parent Course record)
class RelatedLessonsListWrap extends LessonsListWrap {
  RelatedLessonsListWrap({
    required this.parentId,
    required super.recordsMap,
  });
  /// parent record id
  final String parentId;
}