import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/models/domain/state/cobject_form_wrap.dart';
import '../course.dart';

class CourseFormWrap extends CObjectFormWrap {
  CourseFormWrap(this.record) 
    : isNew = record.id == null,
      oldRecord = record.copy()
    {
      _setFormTextFields();
    }
  
  @override
  final Course oldRecord;
  @override
  final Course record;
      
  /// true if user is creating a record
  @override
  final bool isNew;
  @override
  late Map<String, TextCField> fieldsMap;


// ======= INIT FORM =======
  /// set current fields values
  void _setFormTextFields() => fieldsMap = record.formData.textFieldsMap();


// ======= ON SAVE FORM =======
  /// Validates values entered in the form,
  /// sets those values and system values (such as createdDate)
  /// in the db data object which will be sent to the server db while saving.
  @override
  void prepareToSave() {
    record.formData.validateFields(); // throws exception if not validated
    record.formData.addTimeStamp(); // set createdDate / modifiedDate
  }
}
