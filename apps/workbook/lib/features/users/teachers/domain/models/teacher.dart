import '../../../profile/domain/models/profile.dart';
import '../../data/models/teacher_db_data.dart';
import 'teacher_form_data.dart';

class Teacher extends Profile {
// ----- CONSTRUCTORS -----
  /// creates an new Teacher with empty fields: used on registration_screen
  Teacher.create() :
    dbData = const TeacherDbData() {
      formData = TeacherFormData(
        dbData: dbData,
      );
    }
    

  /// parse db map to Teacher obj
  Teacher.fromDbObject({
    required this.dbData,
  }) :
    formData = TeacherFormData(dbData: dbData);

  /// Creates anew course object from pa,ssed values.
  /// Use this constructor to create a copy of another course.
  Teacher.copy({
    required this.dbData,
    required this.formData,
  });

  
  @override
  String? get id => dbData.id;

// ----- DB DATA ----
  /// course data from db
  @override
  final TeacherDbData dbData;

// ----- FORM DATA ----
  /// course data from db
  @override
  late final TeacherFormData formData;

// ----- DB METHODS -----
  /// convert Teacher to db map
  @override
  Map<String, dynamic> toJson() =>
    // convert db data to Json
    dbData.toJson()
    // add form values to the map
    ..addAll(formData.toJson());

// ----- COPY OBJECT METHOD -----
  /// returns current Teacher obj copy as a new Instance of Teacher
  /// used while updating Teacher to store the old value
  @override
  Teacher copy({
    String? nameValue, 
    String? userId,
    String? photoUrl,
  }) => Teacher.copy(
    dbData: dbData.copyWith(
      name: nameValue ?? dbData.name,
      userId: userId ?? dbData.userId,
      photoUrl: photoUrl,
    ),
    formData: formData,
  );
}
