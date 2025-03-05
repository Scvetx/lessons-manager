import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../cobject.dart';

abstract class CObjectFormWrap {

  CObject get record;
  CObject get oldRecord;

  bool get isNew;

  Map<String, TextCField> get fieldsMap;

// ======= ON SAVE FORM =======
  /// Validates values entered in the form,
  /// sets those values and system values (such as createdDate)
  /// in the db data object which will be sent to the server db while saving.
  void prepareToSave();
}