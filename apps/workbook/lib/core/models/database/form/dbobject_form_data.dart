import '../scheme/dbobject_form_scheme.dart';

/// Fields, modified on DBobject when a record is being updated
abstract class DBObjectFormData {
   DBObjectFormData({
    required this.createdDate,
    required this.modifiedDate,
  });

  DateTime? createdDate;
  DateTime? modifiedDate;

  // ----- GET FIELDS MAP -----
  /// get form field values map
  Map<String, dynamic> toJson() => {
    DBObjectFormScheme.fCreatedDateKey: createdDate,
    DBObjectFormScheme.fModifiedDateKey: modifiedDate,
  };

  // ----- FIELDS METHODS -----
  /// Use this method when saving a record. Sets timestamps:
  /// - [modifiedDate] every time when saving the record to db
  /// - [createdDate] when saving the record to db for the forst time
  void addTimeStamp() {
    final now = DateTime.now().toUtc();
    createdDate ??= now; // set value if null (it's null if creating new record)
    modifiedDate = now;
  }
}