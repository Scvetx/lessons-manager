// Contains scheme of fields which are modified on the record's edit form.
// The fields:
// - createdDate - utc now() at the moment user pressed save on a new record
// - modifiedDate - utc now() at the moment user pressed save 
// * Extends DBObjectScheme which contains unmodifiable fields scheme
class DBObjectFormScheme {
  static const String fCreatedDateKey = 'createdDate';
  static const String fModifiedDateKey = 'modifiedDate';
}