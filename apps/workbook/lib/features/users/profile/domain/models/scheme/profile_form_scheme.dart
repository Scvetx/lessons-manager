
import 'package:injectable/injectable.dart';

import '../../../../../../core/getit/injection.dart';
import '../../../../../../core/models/domain/scheme/cfield.dart';
import '../../../../../../core/models/domain/scheme/cobject_form_scheme.dart';
import '../../../../../../core/utils/labels.dart';

/// Scheme of course fields on the edit form

@lazySingleton
class ProfileFormScheme {
  // name field
  static const int fNameLength = 100;

  late final TextCFieldScheme nameFieldScheme = TextCFieldScheme(
    key: CObjectFormScheme.fNameKey, 
    label: getIt<Labels>().l10n.cobjectFieldLabelName,
    maxNumberOfLines: CObjectFormScheme.fNameMaxLines,
    maxLength: fNameLength,
  );

  // email field
  static const String fEmailKey = 'email';
  static const int fEmailLength = 300;
  static const int fEmailMaxLines = 1;

  late final TextCFieldScheme emailFieldScheme = TextCFieldScheme(
    key: fEmailKey, 
    label: getIt<Labels>().l10n.profileFieldLabelEmail,
    maxLength: fEmailLength,
    maxNumberOfLines: fEmailMaxLines,
  );

  // password field
  static const String fPasswordKey = 'password';
  static const int fPasswordMaxLengt = 70;

  late final TextCFieldScheme passwordFieldScheme = TextCFieldScheme(
    key: fPasswordKey, 
    label: getIt<Labels>().l10n.profileFieldLabelPassword,
    maxNumberOfLines: 1,
    maxLength: fPasswordMaxLengt,
  );

  // photo field
  static const String fPhotoKey = 'photoUrl';

  late final PhotoFieldScheme photoFieldScheme = PhotoFieldScheme(
    key: fPhotoKey, 
    label: getIt<Labels>().l10n.profileFieldLabelPhoto,
  );
}