import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/models/domain/form/cobject_form_data.dart';
import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/ui/validators/email_validator.dart';
import '../../../../../core/utils/labels.dart';
import '../../data/models/profile_db_object.dart';
import 'scheme/profile_form_scheme.dart';

abstract class ProfileFormData extends CObjectFormData {
  ProfileFormData({
    required ProfileDBData dbData,
  }) :
    photo = PhotoField(
      scheme: getIt<ProfileFormScheme>().photoFieldScheme,
      value: dbData.photoUrl, // null if empty because it's not a text field
    ),
    email = TextCField(
      scheme: getIt<ProfileFormScheme>().emailFieldScheme,
      value: dbData.email,
    ),
    password = TextCField(
      scheme: getIt<ProfileFormScheme>().passwordFieldScheme,
    ),
    super.fromDbObject(
      nameFieldScheme: getIt<ProfileFormScheme>().nameFieldScheme,
      dbData: dbData,
    );

// ----- FORM FIELDS -----
  /// user's photo URL
  final PhotoField photo;

  /// user's email
  final TextCField email;

  /// user's password
  final TextCField password;

// ----- GET FIELDS MAP -----
  /// get form field values map
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      ProfileFormScheme.fPhotoKey: photo.value,
      ProfileFormScheme.fEmailKey: email.value,
    });

  /// get text fields for the form
  @override
  Map<String, TextCField> textFieldsMap() => super.textFieldsMap()
    ..addAll({
      ProfileFormScheme.fEmailKey: email,
    });

// ----- VALIDATE FIELDS METHODS -----
  /// validate entered Profile fields
  @override
  void validateFields() {
    super.validateFields();
    validateEmail();
  }

  void validateEmail() {
    final l10n = getIt<Labels>().l10n;
    try {
      EmailValidator(email.value).validate();
    // ignore: unused_catch_clause
    } on EmailEmptyException catch (e) {
      // error if empty email
      final errMsg = '${email.scheme.label} ${l10n.errFieldNotEntered}';
      throw ValidationException(errMsg);
    // ignore: unused_catch_clause
    } on WrongEmailFormatException catch (e) {
      // error if email format is not valid
      final errMsg = l10n.profileErrEmailIsNotValid;
      throw ValidationException(errMsg);
    }
  }
}