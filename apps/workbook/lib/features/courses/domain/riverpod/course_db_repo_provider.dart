import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../data/repository/course_db_repository.dart';

final courseDbRepoProvider = Provider<CourseDbRepository>(
  (ref) => getIt<CourseDbRepository>(),
);
