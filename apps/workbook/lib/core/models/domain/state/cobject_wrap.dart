import '../cobject.dart';
import 'cobject_form_wrap.dart';

abstract class CObjectWrap {
  CObject get record;
  
  bool get isNew;

  CObjectFormWrap get formWrap;
}

