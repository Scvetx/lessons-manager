/// fields common in all the database objects
abstract class DBObject {
// ----- DB FIELDS -----
  /// record created utc date in db
  DateTime? get createdDate; 

  /// record modified utc date in db
  DateTime? get modifiedDate;

  /// record id in database
  String? get id;

  // converts DBObject to JSON
  Map<String, dynamic> toMap();
}

/// fields common in all the database objects
abstract class CObjectDBData extends DBObject {
// ----- DB FIELDS -----
  /// record id in database
  String get name;
}
