import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/getit/injection.dart';
import '../../data/repository/teacher_db_repository.dart';

final teacherDbRepoProvider = Provider<TeacherDbRepository>(
  (ref) => getIt<TeacherDbRepository>(),
);
