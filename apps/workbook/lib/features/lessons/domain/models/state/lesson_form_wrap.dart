import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/models/domain/state/cobject_form_wrap.dart';
import '../lesson.dart';

class LessonFormWrap extends CObjectFormWrap {
  LessonFormWrap(this.record) 
    : isNew = record.id == null,
      oldRecord = record.copy()
    {
      _defineShowedElements();
      _setFormTextFields();
    }

  @override
  final Lesson oldRecord;
  @override
  final Lesson record;
      
  /// true if user is creating a record
  @override
  final bool isNew;
  @override
  late Map<String, TextCField> fieldsMap;

  /// true if when creating a lesson it wasn't linked to any course
  late final bool showCoursesList;


// ======= INIT FORM =======
  /// set current fields values
  void _setFormTextFields() => fieldsMap = record.formData.textFieldsMap();

  /// defines which elements will be shown on the form layout
  void _defineShowedElements() {
    final createdFromCourse = isNew && record.dbData.courseId != null;
    showCoursesList = !createdFromCourse;
  }
  

// ======= ON SAVE FORM =======
  /// Validates values entered in the form,
  /// sets those values and system values (such as createdDate)
  /// in the db data object which will be sent to the server db while saving.
  @override
  void prepareToSave() {
    record.formData.validateFields(); // throws exception if not validated
    record.formData.addTimeStamp(); // set createdDate / modifiedDate
  }

// ======= PARENT COURSE MODIFICATIONS =======
  /// set parent course to the lesson (when selected)
  set courseId(String? courseId) => 
      record.formData.courseId.value = courseId;
  /// get selected parent course
  String? get courseId => 
      record.formData.courseId.value;
}
