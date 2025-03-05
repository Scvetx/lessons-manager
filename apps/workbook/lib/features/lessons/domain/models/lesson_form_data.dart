import '../../../../core/getit/injection.dart';
import '../../../../core/models/domain/form/cobject_form_data.dart';
import '../../../../core/models/domain/scheme/cfield.dart';
import '../../data/models/lesson_db_data.dart';
import 'scheme/lesson_form_scheme.dart';

class LessonFormData extends CObjectFormData {
  LessonFormData({
    required LessonDbData dbData,
  }) :
    description = TextCField( 
      scheme: getIt<LessonFormScheme>().descriptionFieldScheme,
      value: dbData.description,
    ),
    languageLevel = LanguageLevelField(
      scheme: getIt<LessonFormScheme>().languageLevelFieldScheme,
      valueStr: dbData.languageLevel,
    ),
    courseId = IdField(
      scheme: getIt<LessonFormScheme>().courseIdFieldScheme,
      value: dbData.courseId,
    ),
    super.fromDbObject(
      nameFieldScheme: getIt<LessonFormScheme>().nameFieldScheme,
      dbData: dbData,
    );

// ----- FORM FIELDS -----
  /// lesson description
  final TextCField description;
  /// lesson language level
  final LanguageLevelField languageLevel;
  // Parent course id
  final IdField courseId;

// ----- GET FIELDS MAP -----
  /// get form field values map
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      LessonFormScheme.fDescriptionKey: description.value,
      LessonFormScheme.fLanguageLevelKey: languageLevel.value,
      LessonFormScheme.fCourseIdKey: courseId.value,
    });

  /// get text fields for the form
  @override
  Map<String, TextCField> textFieldsMap() => super.textFieldsMap()
    ..addAll({
      LessonFormScheme.fDescriptionKey: description,
    });
}