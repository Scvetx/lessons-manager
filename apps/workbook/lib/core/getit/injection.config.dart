// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:workbook/core/firebase/push_notifications/handlers/local_notifications.dart'
    as _i566;
import 'package:workbook/core/firebase/push_notifications/handlers/push_notifications.dart'
    as _i782;
import 'package:workbook/core/getit/injectable.module.dart' as _i899;
import 'package:workbook/core/models/domain/scheme/cobject_form_scheme.dart'
    as _i917;
import 'package:workbook/core/navigation/routes/app_router.dart' as _i784;
import 'package:workbook/core/utils/labels.dart' as _i602;
import 'package:workbook/core/utils/utils.dart' as _i1028;
import 'package:workbook/features/courses/data/repository/course_db_repository.dart'
    as _i498;
import 'package:workbook/features/courses/data/repository/course_db_service.dart'
    as _i5;
import 'package:workbook/features/courses/domain/models/scheme/course_form_scheme.dart'
    as _i913;
import 'package:workbook/features/lessons/data/repository/lesson_db_repository.dart'
    as _i326;
import 'package:workbook/features/lessons/data/repository/lesson_db_service.dart'
    as _i79;
import 'package:workbook/features/lessons/domain/models/scheme/lesson_form_scheme.dart'
    as _i446;
import 'package:workbook/features/users/auth/data/repository/firebase_auth_repo.dart'
    as _i874;
import 'package:workbook/features/users/profile/data/repository/user_repo.dart'
    as _i945;
import 'package:workbook/features/users/profile/domain/models/scheme/profile_form_scheme.dart'
    as _i990;
import 'package:workbook/features/users/students/data/repository/student_db_repository.dart'
    as _i328;
import 'package:workbook/features/users/students/data/repository/student_db_service.dart'
    as _i764;
import 'package:workbook/features/users/students/domain/models/scheme/student_form_scheme.dart'
    as _i438;
import 'package:workbook/features/users/teachers/data/repository/teacher_db_repository.dart'
    as _i618;
import 'package:workbook/features/users/teachers/data/repository/teacher_db_service.dart'
    as _i496;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i784.AppRouter>(() => _i784.AppRouter());
    gh.lazySingleton<_i1028.ContextVariables>(() => _i1028.ContextVariables());
    gh.lazySingleton<_i602.Labels>(() => _i602.Labels());
    gh.lazySingleton<_i917.CObjectFormScheme>(() => _i917.CObjectFormScheme());
    gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => injectableModule.firebaseFirestore);
    gh.lazySingleton<_i566.LocalNotifications>(
        () => _i566.LocalNotifications());
    gh.lazySingleton<_i782.PushNotifications>(() => _i782.PushNotifications());
    gh.lazySingleton<_i5.CourseDbService>(() => _i5.CourseDbService());
    gh.lazySingleton<_i913.CourseFormScheme>(() => _i913.CourseFormScheme());
    gh.lazySingleton<_i496.TeacherDbService>(() => _i496.TeacherDbService());
    gh.lazySingleton<_i764.StudentDbService>(() => _i764.StudentDbService());
    gh.lazySingleton<_i438.StudentFormScheme>(() => _i438.StudentFormScheme());
    gh.lazySingleton<_i990.ProfileFormScheme>(() => _i990.ProfileFormScheme());
    gh.lazySingleton<_i79.LessonDbService>(() => _i79.LessonDbService());
    gh.lazySingleton<_i446.LessonFormScheme>(() => _i446.LessonFormScheme());
    gh.lazySingleton<_i874.FirebaseAuthRepository>(
        () => _i874.FirebaseAuthRepository(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i618.TeacherDbRepository>(
        () => _i618.TeacherDbRepository(gh<_i496.TeacherDbService>()));
    gh.lazySingleton<_i328.StudentDbRepository>(
        () => _i328.StudentDbRepository(gh<_i764.StudentDbService>()));
    gh.lazySingleton<_i945.UserRepository>(() => _i945.UserRepository(
          gh<_i618.TeacherDbRepository>(),
          gh<_i328.StudentDbRepository>(),
          gh<_i874.FirebaseAuthRepository>(),
        ));
    gh.lazySingleton<_i326.LessonDbRepository>(() => _i326.LessonDbRepository(
          gh<_i79.LessonDbService>(),
          gh<_i945.UserRepository>(),
        ));
    gh.lazySingleton<_i498.CourseDbRepository>(() => _i498.CourseDbRepository(
          gh<_i5.CourseDbService>(),
          gh<_i326.LessonDbRepository>(),
          gh<_i945.UserRepository>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i899.InjectableModule {}
