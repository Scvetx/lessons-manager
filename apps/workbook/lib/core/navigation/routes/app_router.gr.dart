// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CourseFormScreen]
class CourseFormRoute extends PageRouteInfo<void> {
  const CourseFormRoute({List<PageRouteInfo>? children})
    : super(CourseFormRoute.name, initialChildren: children);

  static const String name = 'CourseFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseFormScreen();
    },
  );
}

/// generated route for
/// [CourseViewScreen]
class CourseViewRoute extends PageRouteInfo<void> {
  const CourseViewRoute({List<PageRouteInfo>? children})
    : super(CourseViewRoute.name, initialChildren: children);

  static const String name = 'CourseViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CourseViewScreen();
    },
  );
}

/// generated route for
/// [CoursesScreen]
class CoursesRoute extends PageRouteInfo<void> {
  const CoursesRoute({List<PageRouteInfo>? children})
    : super(CoursesRoute.name, initialChildren: children);

  static const String name = 'CoursesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CoursesScreen();
    },
  );
}

/// generated route for
/// [FirstLoginScreen]
class FirstLoginRoute extends PageRouteInfo<void> {
  const FirstLoginRoute({List<PageRouteInfo>? children})
    : super(FirstLoginRoute.name, initialChildren: children);

  static const String name = 'FirstLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FirstLoginScreen();
    },
  );
}

/// generated route for
/// [LessonFormScreen]
class LessonFormRoute extends PageRouteInfo<void> {
  const LessonFormRoute({List<PageRouteInfo>? children})
    : super(LessonFormRoute.name, initialChildren: children);

  static const String name = 'LessonFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LessonFormScreen();
    },
  );
}

/// generated route for
/// [LessonViewScreen]
class LessonViewRoute extends PageRouteInfo<void> {
  const LessonViewRoute({List<PageRouteInfo>? children})
    : super(LessonViewRoute.name, initialChildren: children);

  static const String name = 'LessonViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LessonViewScreen();
    },
  );
}

/// generated route for
/// [LessonsScreen]
class LessonsRoute extends PageRouteInfo<LessonsRouteArgs> {
  LessonsRoute({Key? key, String? courseId, List<PageRouteInfo>? children})
    : super(
        LessonsRoute.name,
        args: LessonsRouteArgs(key: key, courseId: courseId),
        initialChildren: children,
      );

  static const String name = 'LessonsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonsRouteArgs>(
        orElse: () => const LessonsRouteArgs(),
      );
      return LessonsScreen(key: args.key, courseId: args.courseId);
    },
  );
}

class LessonsRouteArgs {
  const LessonsRouteArgs({this.key, this.courseId});

  final Key? key;

  final String? courseId;

  @override
  String toString() {
    return 'LessonsRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [PasswordEditScreen]
class PasswordEditRoute extends PageRouteInfo<void> {
  const PasswordEditRoute({List<PageRouteInfo>? children})
    : super(PasswordEditRoute.name, initialChildren: children);

  static const String name = 'PasswordEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PasswordEditScreen();
    },
  );
}

/// generated route for
/// [PhotoEditScreen]
class PhotoEditRoute extends PageRouteInfo<void> {
  const PhotoEditRoute({List<PageRouteInfo>? children})
    : super(PhotoEditRoute.name, initialChildren: children);

  static const String name = 'PhotoEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PhotoEditScreen();
    },
  );
}

/// generated route for
/// [ProfileFormScreen]
class ProfileFormRoute extends PageRouteInfo<void> {
  const ProfileFormRoute({List<PageRouteInfo>? children})
    : super(ProfileFormRoute.name, initialChildren: children);

  static const String name = 'ProfileFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileFormScreen();
    },
  );
}

/// generated route for
/// [ProfileViewScreen]
class ProfileViewRoute extends PageRouteInfo<void> {
  const ProfileViewRoute({List<PageRouteInfo>? children})
    : super(ProfileViewRoute.name, initialChildren: children);

  static const String name = 'ProfileViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileViewScreen();
    },
  );
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
    : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegistrationScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [StudentFormScreen]
class StudentFormRoute extends PageRouteInfo<StudentFormRouteArgs> {
  StudentFormRoute({Key? key, Student? student, List<PageRouteInfo>? children})
    : super(
        StudentFormRoute.name,
        args: StudentFormRouteArgs(key: key, student: student),
        initialChildren: children,
      );

  static const String name = 'StudentFormRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudentFormRouteArgs>(
        orElse: () => const StudentFormRouteArgs(),
      );
      return StudentFormScreen(key: args.key, student: args.student);
    },
  );
}

class StudentFormRouteArgs {
  const StudentFormRouteArgs({this.key, this.student});

  final Key? key;

  final Student? student;

  @override
  String toString() {
    return 'StudentFormRouteArgs{key: $key, student: $student}';
  }
}

/// generated route for
/// [StudentViewScreen]
class StudentViewRoute extends PageRouteInfo<StudentViewRouteArgs> {
  StudentViewRoute({
    Key? key,
    required Student student,
    List<PageRouteInfo>? children,
  }) : super(
         StudentViewRoute.name,
         args: StudentViewRouteArgs(key: key, student: student),
         initialChildren: children,
       );

  static const String name = 'StudentViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudentViewRouteArgs>();
      return StudentViewScreen(key: args.key, student: args.student);
    },
  );
}

class StudentViewRouteArgs {
  const StudentViewRouteArgs({this.key, required this.student});

  final Key? key;

  final Student student;

  @override
  String toString() {
    return 'StudentViewRouteArgs{key: $key, student: $student}';
  }
}

/// generated route for
/// [StudentsScreen]
class StudentsRoute extends PageRouteInfo<StudentsRouteArgs> {
  StudentsRoute({Key? key, String? courseId, List<PageRouteInfo>? children})
    : super(
        StudentsRoute.name,
        args: StudentsRouteArgs(key: key, courseId: courseId),
        initialChildren: children,
      );

  static const String name = 'StudentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StudentsRouteArgs>(
        orElse: () => const StudentsRouteArgs(),
      );
      return StudentsScreen(key: args.key, courseId: args.courseId);
    },
  );
}

class StudentsRouteArgs {
  const StudentsRouteArgs({this.key, this.courseId});

  final Key? key;

  final String? courseId;

  @override
  String toString() {
    return 'StudentsRouteArgs{key: $key, courseId: $courseId}';
  }
}
