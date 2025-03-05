import '../../../../core/getit/injection.dart';
import '../../../../core/models/domain/form/cobject_form_data.dart';
import '../../../../core/models/domain/scheme/cfield.dart';
import '../../data/models/course_db_data.dart';
import 'scheme/course_form_scheme.dart';

class CourseFormData extends CObjectFormData {
  CourseFormData({
    required CourseDbData dbData,
  }) :
    description = TextCField(
      scheme: getIt<CourseFormScheme>().descriptionFieldScheme,
      value: dbData.description,
    ),
    super.fromDbObject(dbData: dbData);

// ----- FORM FIELDS -----
  final TextCField description; // course description

// ----- GET FIELDS MAP -----
  /// get form field values map
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      CourseFormScheme.fDescriptionKey: description.value,
    });

  /// get text fields for the form
  @override
  Map<String, TextCField> textFieldsMap() => super.textFieldsMap()
    ..addAll({
      CourseFormScheme.fDescriptionKey: description,
    });
}