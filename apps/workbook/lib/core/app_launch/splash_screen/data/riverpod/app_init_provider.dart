import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../features/courses/domain/riverpod/courses_provider.dart';
import '../../../../../features/lessons/domain/riverpod/lessons_provider.dart';
import '../../../../../features/users/profile/domain/riverpod/current_user_provider.dart';
import '../../../../../features/users/students/domain/riverpod/students_provider.dart';
import '../../../../getit/injection.dart';
import '../../../../navigation/routes/app_router.dart';
import '../../../../utils/utils.dart';

part 'app_init_provider.g.dart';

/// Provider which runc an async operation for:
/// - Initializing Firebase instance.
/// - Initializing providers before running the app
///   (push notifications, router provider etc).
/// - Initializing local database
///   (Hive and other local databases which will be used).
@Riverpod(keepAlive: true)
Future<void> appInit(
  Ref ref,
) async {
  try {
    // set ref in app router
    getIt<AppRouter>().ref = ref;
    getIt<AppRouter>().authGuard.ref = ref;
    // init global providers
    await ref.read(currentUserNotifierProvider.notifier).init();
    ref..read(coursesNotifierProvider)
    ..read(lessonsNotifierProvider)
    ..read(studentsNotifierProvider);
  } catch (e, stack) {
    Utils.handleException(e, stack, 'appInit provider error');
    rethrow; // rethrow leads to error ui on the splash screen
  }
}
