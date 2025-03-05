import '../../../../../core/models/database/dbobject.dart';

/// fields common in all the database objects
abstract class ProfileDBData extends CObjectDBData {
// ----- DB FIELDS -----
  /// record created utc date in db
  String? get photoUrl; 

  /// record modified utc date in db
  String get email;
}
