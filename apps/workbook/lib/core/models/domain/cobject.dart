import '../database/dbobject.dart';
import 'form/cobject_form_data.dart';

/// Exception thrown if some field on CObject 
/// has not passed validation while saving the record to db
class ValidationException implements Exception {
  ValidationException(this.msg);
  String msg;
  @override
  String toString() => msg;
}

/// Basic object, containing fields common across the most of db objects
abstract class CObject {

  String? get id;


// ----- FORM DATA -----
  DBObject get dbData;

// ----- FORM DATA -----
  CObjectFormData get formData;

// ----- DB METHODS -----
  Map<String, dynamic> toJson();
}