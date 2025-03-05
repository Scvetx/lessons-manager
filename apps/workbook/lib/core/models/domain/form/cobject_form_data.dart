import '../../../basic_data_types/string_ext.dart';
import '../../../getit/injection.dart';
import '../../../utils/labels.dart';
import '../../database/dbobject.dart';
import '../../database/form/dbobject_form_data.dart';
import '../cobject.dart';
import '../scheme/cfield.dart';
import '../scheme/cobject_form_scheme.dart';

abstract class CObjectFormData extends DBObjectFormData {
  CObjectFormData.fromDbObject({
    required CObjectDBData dbData,
    TextCFieldScheme? nameFieldScheme,
  }) :
  name = TextCField(
    scheme: nameFieldScheme ?? getIt<CObjectFormScheme>().nameFieldScheme,
    value: dbData.name,
  ),
  super(
    createdDate: dbData.createdDate,
    modifiedDate: dbData.modifiedDate,
  );


// ----- FORM FIELDS -----
  final TextCField name; // object name in db

// ----- GET FIELDS MAP -----
  /// get form field values map
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      CObjectFormScheme.fNameKey: name.value,
    });

  /// get text fields for the form
  Map<String, TextCField> textFieldsMap() => {
    CObjectFormScheme.fNameKey: name,
  };

// ----- VALIDATE FIELDS METHODS -----
  // validate entered CObject fields
  void validateFields() {
    validateName();
  }

  /// check if name was entered correctly
  void validateName() {
    if (name.value.isBlank) {
      final l10n = getIt<Labels>().l10n;
      final errMsg = '${name.scheme.label} ${l10n.errFieldNotEntered}';
      throw ValidationException(errMsg);
    }
  }
}