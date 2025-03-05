// Contains scheme of unmodifiable record's fields.
// The fields:
// - createdDate - utc now() at the moment user pressed save on a new record
// - modifiedDate - utc now() at the moment user pressed save 
// * Extends DBObjectScheme which 
class DBObjectScheme {
  static const String fIdKey = 'id';
}