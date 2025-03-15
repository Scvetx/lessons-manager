import 'package:injectable/injectable.dart';

import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../core/utils/labels.dart';
import '../../../../../core/utils/utils.dart';

/// Scheme of course fields on the edit form

@lazySingleton
class CourseFormScheme {
  // description field
  static const String fDescriptionKey = 'description';
  static const int fDescriptionLength = 250;

  final descriptionFieldScheme = TextCFieldScheme(
    key: fDescriptionKey, 
    label: Utils.isTest() ? fDescriptionKey : 
                            getIt<Labels>().l10n.cobjectFieldLabelDescription,
    maxLength: fDescriptionLength,
  );
}