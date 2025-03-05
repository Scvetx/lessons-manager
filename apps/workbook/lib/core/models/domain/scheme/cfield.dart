import '../../../../features/language_level/domain/models/language_level.dart';

// abstract class for records fields scheme
abstract class CFieldScheme {
  const CFieldScheme({
    required this.key,
    required this.label,
  });
  final String key;
  final String label;
}

// abstract class for records fields
abstract class CField {
  CField({
    required this.scheme,
    required this.value,
  });
  final CFieldScheme scheme;
  covariant dynamic value;
}

// text field used on records forms
class TextCFieldScheme extends CFieldScheme {
  const TextCFieldScheme({
    required super.key,
    required super.label,
    this.maxLength,
    this.maxNumberOfLines,
  });
  final int? maxLength;
  final int? maxNumberOfLines;
}

// text field used on records forms
class TextCField implements CField {
  TextCField({
    required this.scheme,
    this.value = '',
  });
  @override
  TextCFieldScheme scheme;
  @override
  String value;

  String get formattedValue => value.trim();
}

// LanguageLevel field used on lessons, students
class LanguageLevelFieldScheme extends CFieldScheme {
  const LanguageLevelFieldScheme({
    required super.key,
    required super.label,
  });
}

// LanguageLevel field used on lessons, students
class LanguageLevelField implements CField {
  LanguageLevelField({
    required this.scheme,
    String valueStr = '',
  })
    : langLevel = LanguageLevel(valueStr);
      
  @override
  final LanguageLevelFieldScheme scheme;
  @override
  String get value => langLevel.value;
  @override
  set value(String value) => langLevel.value = value;

  late LanguageLevel langLevel;

  bool operator >(LanguageLevelField other) => langLevel > other.langLevel;
  bool operator <(LanguageLevelField other) => langLevel < other.langLevel;
}

// Photo field used on profiles
class PhotoFieldScheme extends CFieldScheme {
  const PhotoFieldScheme({
    required super.key,
    required super.label,
  });
}

// Photo field used on profiles
class PhotoField implements CField {
  PhotoField({
    required this.scheme,
    this.value,
  });

  @override
  final PhotoFieldScheme scheme;

  @override
  /// photoUrl
  String? value;
}

// Id field
class IdFieldScheme extends CFieldScheme {
  const IdFieldScheme({
    required super.key,
    required super.label,
  });
}

// Id field
class IdField implements CField {
  IdField({
    required this.scheme,
    this.value,
  });

  @override
  final IdFieldScheme scheme;

  @override
  /// id
  late String? value;
}

// List of ids
class IdsListFieldScheme extends CFieldScheme {
  const IdsListFieldScheme({
    required super.key,
    required super.label,
  });
}

// List of ids
class IdsListField implements CField {
  IdsListField({
    required this.scheme,
    this.value = const [],
  });

  @override
  final IdsListFieldScheme scheme;

  @override
  /// list of ids
  late List<String> value;

  bool contains(String id) => value.contains(id);

  void add(String id) {
    if(contains(id)) return;
    value.add(id);
  }
  void remove(String id) {
    if(!contains(id)) return;
    value.remove(id);
  }
}


