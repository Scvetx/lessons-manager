import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../data/repository/student_db_repository.dart';

final studentDbRepoProvider = Provider<StudentDbRepository>(
  (ref) => getIt<StudentDbRepository>(),
);
