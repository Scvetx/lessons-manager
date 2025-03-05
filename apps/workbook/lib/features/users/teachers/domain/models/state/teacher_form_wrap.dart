import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../profile/domain/models/state/profile_form_wrap.dart';
import '../teacher.dart';
class TeacherFormWrap extends ProfileFormWrap {
  TeacherFormWrap(this.record) 
    : isNew = record.id == null,
      oldRecord = record.copy()
    {
      _setFormTextFields();
    }
      
  @override
  final Teacher oldRecord;
  @override
  final Teacher record;

  @override
  final bool isNew;  

  @override
  late final Map<String, TextCField> fieldsMap;


// ======= INIT FORM =======
  /// set current fields values
  void _setFormTextFields() => 
    fieldsMap = record.formData.textFieldsMap();


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