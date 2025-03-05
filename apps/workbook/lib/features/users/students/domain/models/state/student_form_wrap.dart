import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../auth/data/repository/firebase_auth_repo.dart';
import '../../../../profile/domain/models/state/profile_form_wrap.dart';
import '../student.dart';
class StudentFormWrap extends ProfileFormWrap {
  StudentFormWrap(this.record) 
    : isNew = record.id == null,
      oldRecord = record.copy()
    {
      _defineShowedElements();
      _setFormTextFields();
    }
      
  @override
  final Student oldRecord;
  @override
  final Student record;

  @override
  final bool isNew;  

  @override
  late final Map<String, TextCField> fieldsMap;

  /// true if when creating a student it wasn't linked to any courses
  late final bool showCoursesList;


// ======= INIT FORM =======
  /// set current fields values
  void _setFormTextFields() => 
    fieldsMap = record.dbData.isVerified ? 
        {} : 
        record.formData.textFieldsMap();

  /// defines which elements will be shown on the form layout
  void _defineShowedElements() {
    final createdFromCourse = isNew && record.dbData.coursesIds.isNotEmpty;
    showCoursesList = !createdFromCourse;
  }


// ======= ON SAVE FORM =======
  /// Validates values entered in the form,
  /// sets those values and system values (such as createdDate)
  /// in the db data object which will be sent to the server db while saving.
  @override
  void prepareToSave() {
    record.formData.validateFields(); // throws exception if not validated
    // generate password for student's forst login
    // this password the teacher sends to the student
    // when creating the student in db
    // TODO: handle the case when student already has an access to the app
    if (isNew) {
      record.firstLoginPassword = 
        getIt<FirebaseAuthRepository>().generatePassword();
    }
    record.formData.addTimeStamp(); // set createdDate / modifiedDate
  }

// ======= COURSES LIST MODIFICATIONS =======
  /// add course to the student
  void addCourse(String courseId) => 
      record.formData.coursesIds.add(courseId);

  /// remove course from the student
  void removeCourse(String courseId) => 
      record.formData.coursesIds.remove(courseId);

  /// remove course from the student
  void containsCourse(String courseId) => 
      record.formData.coursesIds.contains(courseId);
}