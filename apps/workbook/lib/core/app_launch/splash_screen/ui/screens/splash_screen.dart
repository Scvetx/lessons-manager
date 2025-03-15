import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../features/users/profile/domain/riverpod/current_user_provider.dart';
import '../../../../getit/injection.dart';
import '../../../../navigation/constants/default_routes.dart';
import '../../../../navigation/navigation_service.dart';
import '../../../../navigation/routes/app_router.dart';
import '../../../../utils/labels.dart';
import '../../data/riverpod/app_init_provider.dart';

/// Manages initialization before opening the home screen
@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({
    super.key,
  });

  // init l10n for the current app launch
  void _initLabels(BuildContext context) {
    getIt<Labels>().init(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // init l10n for the current app launch
    _initLabels(context);

    ref.watch(appInitProvider).whenData(
      (_) async {
        final currentUser = ref.read(currentUserNotifierProvider);
        if(currentUser != null) {
          await NavigationService.replace(DefaultRoutes().homeRoute);

        } else {
          final loginScreenOpened = NavigationService.containsRoute(
            LoginRoute.name,
          );
          if(loginScreenOpened) return;
          await NavigationService.replace(DefaultRoutes().loginRoute);

        }
      }
    );

    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}