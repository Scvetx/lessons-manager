import '../../../../core/models/domain/cobject.dart';
import '../../data/models/course_db_data.dart';
import 'course_form_data.dart';

/// This class is used to view course data in UI and in all other cases when 
/// we need to get the actual course data in db.
/// The class contains course data from db
/// and db data of related to this course records.
class Course extends CObject {
// ----- CONSTRUCTORS -----
  /// Creates a new Course with empty fields: used on course_form_screen
  Course.create({required String teacherId}) :
      dbData = CourseDbData(
        teacherId: teacherId,
      ) {
        formData = CourseFormData(
          dbData: dbData,
        );
      }
  
  /// Creates a new Course with empty fields: used on course_form_screen
  Course.fromDbObject({required this.dbData}) :
      formData = CourseFormData(dbData: dbData);
  
  /// Creates a new course object from passed values.
  /// Use this constructor to create a copy of another course.
  Course.copy({
    required this.dbData,
    required this.formData,
  });


  @override
  String? get id => dbData.id;

// ----- DB DATA ----
  /// course data from db
  @override
  final CourseDbData dbData;

// ----- FORM DATA -----
  @override
  late final CourseFormData formData;


// ----- DB METHODS -----
  /// convert Course to db Json
  @override
  Map<String, dynamic> toJson() =>
    // convert db data to Json
    dbData.toJson()
    // add form values to the map
    ..addAll(formData.toJson());

// ----- COPY OBJECT METHOD -----
  /// returns current Course obj copy as a new Instance of Course
  /// used while updating Course to store the old value
  Course copy({String? nameValue}) => Course.copy(
    dbData: dbData, 
    formData: formData,
  );
}

