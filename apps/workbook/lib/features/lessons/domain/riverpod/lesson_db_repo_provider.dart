import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/getit/injection.dart';
import '../../data/repository/lesson_db_repository.dart';

final lessonDbRepoProvider = Provider<LessonDbRepository>(
  (ref) => getIt<LessonDbRepository>(),
);
