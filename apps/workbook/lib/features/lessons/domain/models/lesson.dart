import '../../../../core/models/domain/cobject.dart';
import '../../data/models/lesson_db_data.dart';
import 'lesson_form_data.dart';

class Lesson extends CObject {
// ----- CONSTRUCTORS -----
  /// creates a new Lesson with empty fields: used on lesson_form_screen
  Lesson.create({
    required String teacherId,
    String? courseId,
  }) :
      dbData = LessonDbData(
        teacherId: teacherId,
        courseId: courseId,
      ) {      
        formData = LessonFormData(
          dbData: dbData,
        );
      }

  /// Creates a new Course with empty fields: used on course_form_screen
  Lesson.fromDbObject({required this.dbData}) :
      formData = LessonFormData(dbData: dbData);

  /// Creates a new course object from passed values.
  /// Use this constructor to create a copy of another course.
  Lesson.copy({
    required this.dbData,
    required this.formData,
  });


  @override
  String? get id => dbData.id;

// ----- DB DATA ----
  /// course data from db
  @override
  final LessonDbData dbData;

// ----- FORM DATA -----
  @override
  late final LessonFormData formData;

// ----- DB METHODS -----
  /// convert lesson to db Json
  @override
  Map<String, dynamic> toJson() =>
    // convert db data to Json
    dbData.toJson()
    // add form values to the map
    ..addAll(formData.toJson());

// ----- COPY OBJECT METHOD -----
  /// returns current Lesson obj copy as a new Instance of Lesson
  /// used while updating Lesson to store the old value
  Lesson copy() => Lesson.copy(
    dbData: dbData,
    formData: formData,
  );
}