import '../../../../../core/getit/injection.dart';
import '../../../../../core/models/domain/state/cobject_wrap.dart';
import '../../../../users/profile/data/repository/user_repo.dart';
import '../lesson.dart';
import 'lesson_form_wrap.dart';

class LessonWrap extends CObjectWrap {
  LessonWrap(this.record) :
    isNew = false;
  
  LessonWrap.createLesson({
    String? courseId,
  }) :
    record = Lesson.create(
      teacherId: getIt<UserRepository>().profileId!,
      courseId: courseId,
    ),
    isNew = true;

  @override
  final Lesson record;

  @override
  final bool isNew;

  @override
  LessonFormWrap get formWrap => _formWrap ??= LessonFormWrap(record);
  LessonFormWrap? _formWrap;
}
