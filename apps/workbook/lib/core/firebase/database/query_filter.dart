/* Query filters wrapper classes for .where() Firebase db function
*/

enum StringQueryOperator { equal, notEqual }

enum BoolQueryOperator { equal, notEqual }

enum ListStringQueryOperator { whereIn, whereNotIn }

abstract class QueryFilter {
  QueryFilter({required this.field});
  final dynamic field;
}

abstract class BoolQueryFilter extends QueryFilter {
  BoolQueryFilter({
    required super.field, 
    required this.value, 
    required this.equal,
  }) :
    operator = equal ? 
      BoolQueryOperator.equal : 
      BoolQueryOperator.notEqual;

  final bool value;
  final BoolQueryOperator operator;
  final bool equal;
}

abstract class StringQueryFilter extends QueryFilter {
  StringQueryFilter({
    required super.field, 
    required this.value, 
    required this.equal,
  }) :
    operator = equal ? 
      StringQueryOperator.equal : 
      StringQueryOperator.notEqual;

  final String value;
  final StringQueryOperator operator;
  final bool equal;
}

abstract class ListStringQueryFilter extends QueryFilter {
  ListStringQueryFilter({
    required super.field, 
    required this.value, 
    required this.inList,
  }) :
    operator = inList ? 
            ListStringQueryOperator.whereIn : 
            ListStringQueryOperator.whereNotIn;

  final List<String> value;
  final ListStringQueryOperator operator;
  final bool inList;
}

// ----- BOOLEAN FILTERS -----

class IsActiveQueryFilter extends BoolQueryFilter {
  // ignore: avoid_positional_boolean_parameters
  IsActiveQueryFilter(bool value, {
    super.equal = true,
  }) :
      super(
        value: value, 
        field: fIsActive,
      );
  static const String fIsActive = 'isActive';
}

// ----- STRING FILTERS -----

class TeacherIdQueryFilter extends StringQueryFilter { 
  TeacherIdQueryFilter(String value, {
    super.equal = true,
  }) :
      super(
        value: value,
        field: fTeacherId,
      );
  static const String fTeacherId = 'teacherId';
}

class UserIdQueryFilter extends StringQueryFilter { 
  UserIdQueryFilter(String value, {
    super.equal = true,
  }) :
      super(
        value: value,
        field: fUserId, 
      );
  static const String fUserId = 'userId';
}

class StudentIdQueryFilter extends StringQueryFilter {
  StudentIdQueryFilter(String value, {
    super.equal = true,
  }) :
      super(
        value: value,
        field: fStudentId,
      );
  static const String fStudentId = 'studentId';
}

class CourseIdQueryFilter extends StringQueryFilter {
  CourseIdQueryFilter(String value, {
    super.equal = true,
  }) :
      super(
        value: value,
        field: fCourseId,
      );
  static const String fCourseId = 'courseId';
}

// ----- LIST<STRING> FILTERS -----
class CoursesIdsListQueryFilter extends ListStringQueryFilter {
  CoursesIdsListQueryFilter(List<String> value, {
    super.inList = true,
  }) :
      super(
        value: value,
        field: fCourseId,
      );
  static const String fCourseId = 'coursesIds';
}
