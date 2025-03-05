import '../../basic_data_types/string_ext.dart';
import 'validator.dart';

class EmailEmptyException implements Exception {
  EmailEmptyException(this.msg);
  String msg;
  @override
  String toString() => msg;
}
class WrongEmailFormatException implements Exception {
  WrongEmailFormatException(this.msg);
  String msg;
  @override
  String toString() => msg;
}

class EmailValidator implements Validator {
  EmailValidator(this.email);
  final String email;

  @override
  void validate() {
    // error if empty email
    if (email.isBlank) {
      throw EmailEmptyException('Email is empty.');
    }
    // error if email format is not valid
    const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    final validEmail = regex.hasMatch(email);
    if (!validEmail) {
      throw WrongEmailFormatException('Email format is wrong.');
    }
  }
}