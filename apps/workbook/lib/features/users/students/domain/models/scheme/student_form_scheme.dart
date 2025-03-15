import 'package:injectable/injectable.dart';

import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../../core/utils/labels.dart';
import '../../../../../../core/utils/utils.dart';

/// Scheme of student fields on the edit form
@lazySingleton
class StudentFormScheme {
  // goal field
  static const String fGoalKey = 'goal';

  final goalFieldScheme = LanguageLevelFieldScheme(
    key: fGoalKey, 
    label: Utils.isTest() ? fGoalKey : 
                            getIt<Labels>().l10n.languageLabelGoal,
  );

  // language level field
  static const String fLanguageLevelKey = 'languageLevel';

  final languageLevelFieldScheme = LanguageLevelFieldScheme(
    key: fLanguageLevelKey, 
    label: Utils.isTest() ? fLanguageLevelKey : 
                            getIt<Labels>().l10n.languageLabelLevel,
  );

  // courses ids
  static const String fCoursesIdsKey = 'coursesIds';

  final coursesIdsFieldScheme = IdsListFieldScheme(
    key: fCoursesIdsKey, 
    label: Utils.isTest() ? fCoursesIdsKey : 
                            getIt<Labels>().l10n.coursesLabelPlural,
  );
}