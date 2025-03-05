import 'package:injectable/injectable.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/models/domain/scheme/cobject_form_scheme.dart';
import '../../../../../core/utils/labels.dart';

/// Scheme of lesson fields on the edit form
@lazySingleton
class LessonFormScheme {
  // name field
  static const int fNameLength = 100;
  final nameFieldScheme = TextCFieldScheme(
    key: CObjectFormScheme.fNameKey, 
    label: getIt<Labels>().l10n.cobjectFieldLabelName,
    maxNumberOfLines: CObjectFormScheme.fNameMaxLines,
    // ignore: avoid_redundant_argument_values
    maxLength: fNameLength,
  );

  // description field
  static const String fDescriptionKey = 'description';
  static const int fDescriptionLength = 250;

  final descriptionFieldScheme = TextCFieldScheme(
    key: fDescriptionKey, 
    label: getIt<Labels>().l10n.cobjectFieldLabelDescription,
    maxLength: fDescriptionLength,
  );

  // language level field
  static const String fLanguageLevelKey = 'languageLevel';

  final languageLevelFieldScheme = LanguageLevelFieldScheme(
    key: fLanguageLevelKey, 
    label: getIt<Labels>().l10n.languageLabelLevel,
  );

  // courseId field
  static const String fCourseIdKey = 'courseId';
  final courseIdFieldScheme = const IdFieldScheme(
    key: fCourseIdKey, 
    label: '', // label is not shown for parent course on form
  );
}