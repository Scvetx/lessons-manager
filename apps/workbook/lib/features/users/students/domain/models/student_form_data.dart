import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/cobject.dart';
import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/utils/labels.dart';
import '../../../profile/domain/models/profile_form_data.dart';
import '../../data/models/student_db_data.dart';
import 'scheme/student_form_scheme.dart';

class StudentFormData extends ProfileFormData {
  StudentFormData({
    required StudentDbData dbData,
  }) :
    languageLevel = LanguageLevelField(
      scheme: getIt<StudentFormScheme>().languageLevelFieldScheme,
      valueStr: dbData.languageLevel,
    ),
    goal = LanguageLevelField(
      scheme: getIt<StudentFormScheme>().goalFieldScheme,
      valueStr: dbData.goal,
    ),
    coursesIds = IdsListField(
      scheme: getIt<StudentFormScheme>().coursesIdsFieldScheme,
      value: dbData.coursesIds,
    ),
    super(
      dbData: dbData,
    );

// ----- FORM FIELDS -----
  /// student's language level (A1, B1 etc)
  /// This field is filled by the teacher.
  final LanguageLevelField languageLevel;

  /// student's studying goal (target language level)
  final LanguageLevelField goal;

  // List of courses in which the student attends
  final IdsListField coursesIds;
 
// ----- GET FIELDS MAP -----
/// get form field values map
  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      StudentFormScheme.fLanguageLevelKey: languageLevel.value,
      StudentFormScheme.fGoalKey: goal.value,
      StudentFormScheme.fCoursesIdsKey: coursesIds.value,
    }); 

// ----- VALIDATE FIELDS METHODS -----
  /// validate entered Student fields
  @override
  void validateFields() {
    super.validateFields();
    _validateLanguageLevelAndGoal();
  }

  /// ensure that goal is greater than current language level
  void _validateLanguageLevelAndGoal() {
    if (goal.value.isEmpty || languageLevel.value.isEmpty) return;
    if (goal < languageLevel) {
      final l10n = getIt<Labels>().l10n;
      final errMsg = l10n.languageErrLevelGreaterThanGoal;
      throw ValidationException(errMsg);
    }
  }
}
