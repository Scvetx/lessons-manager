import 'package:injectable/injectable.dart';

import '../../../getit/injection.dart';
import '../../../utils/labels.dart';
import 'cfield.dart';

/// Scheme of CObject fields on the edit form
@lazySingleton
class CObjectFormScheme {
  // name field
  static const String fNameKey = 'name';
  static const int fNameMaxLength = 50;
  static const int fNameMaxLines = 1;

  final nameFieldScheme = TextCFieldScheme(
    key: fNameKey, 
    label: getIt<Labels>().l10n.cobjectFieldLabelName,
    maxLength: fNameMaxLength,
    maxNumberOfLines: fNameMaxLines,
  );
}