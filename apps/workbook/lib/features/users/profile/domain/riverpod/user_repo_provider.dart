import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../data/repository/user_repo.dart';

final userRepoProvider = Provider<UserRepository>(
  (ref) => getIt<UserRepository>(),
);
