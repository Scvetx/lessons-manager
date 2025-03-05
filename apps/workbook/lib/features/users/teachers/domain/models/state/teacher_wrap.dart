import '../../../../profile/domain/models/state/profile_wrap.dart';
import '../teacher.dart';
import 'teacher_form_wrap.dart';

class TeacherWrap extends ProfileWrap {
  TeacherWrap(this.record) :
    isNew = false;
  
  TeacherWrap.createTeacher() :
    record = Teacher.create(),
    isNew = true;

  @override
  final Teacher record;
  @override
  final bool isNew;

  TeacherFormWrap? _formWrap;
  @override
  TeacherFormWrap get formWrap => 
    _formWrap ??= TeacherFormWrap(record);
}

