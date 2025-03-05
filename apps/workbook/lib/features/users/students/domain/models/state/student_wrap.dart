import '../../../../../../core/getit/injection.dart';
import '../../../../profile/data/repository/user_repo.dart';
import '../../../../profile/domain/models/state/profile_wrap.dart';
import '../student.dart';
import 'student_form_wrap.dart';

class StudentWrap extends ProfileWrap {
  StudentWrap(this.record) :
    isNew = false;
  
  StudentWrap.createStudent({
    List<String>? coursesIds,
  }) :
    record = Student.create(
      teacherId: getIt<UserRepository>().profileId!,
      coursesIds: coursesIds, 
    ),
    isNew = true;

  @override
  final Student record;
  @override
  final bool isNew;

  StudentFormWrap? _formWrap;
  @override
  StudentFormWrap get formWrap => 
    _formWrap ??= StudentFormWrap(record);
}

