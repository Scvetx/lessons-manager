import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/state/cobject_wrap.dart';
import '../../../../users/profile/data/repository/user_repo.dart';
import '../course.dart';
import 'course_form_wrap.dart';

class CourseWrap extends CObjectWrap{
  CourseWrap(
    this.record,
  ) :
    isNew = false;
  
  CourseWrap.createCourse() :
    isNew = true,
    record = Course.create(
      teacherId: getIt<UserRepository>().profileId!,
    );

  @override
  final Course record;

  @override
  final bool isNew; 
  
  @override
  CourseFormWrap get formWrap => _formWrap ??= CourseFormWrap(record);
  CourseFormWrap? _formWrap;
}
