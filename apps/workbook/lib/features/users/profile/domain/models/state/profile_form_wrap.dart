import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../../core/models/domain/state/cobject_form_wrap.dart';
import '../profile.dart';

abstract class ProfileFormWrap extends CObjectFormWrap {

  @override
  Profile get oldRecord;
  @override
  Profile get record;

  @override
  bool get isNew;
  @override
  Map<String, TextCField> get fieldsMap;

// ======= ON SAVE FORM =======
  /// Validates values entered in the form,
  /// sets those values and system values (such as createdDate)
  /// in the db data object which will be sent to the server db while saving.
  @override
  void prepareToSave();
}