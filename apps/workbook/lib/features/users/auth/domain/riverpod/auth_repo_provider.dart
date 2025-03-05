import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/getit/injection.dart';
import '../../data/repository/firebase_auth_repo.dart';

final authRepoProvider = Provider<FirebaseAuthRepository>(
  (ref) => getIt<FirebaseAuthRepository>(),
);
