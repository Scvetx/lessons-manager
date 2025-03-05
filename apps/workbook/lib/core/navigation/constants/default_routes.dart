// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';

import '../routes/app_router.dart';

class DefaultRoutes {
  static const homeRouteName = CoursesRoute.name;
  static const onboardingRouteName = LoginRoute.name;
  static const loginRouteName = LoginRoute.name;
  static const registrationRouteName = RegistrationRoute.name;
  static const splashRouteName = SplashRoute.name;

   PageRouteInfo get homeRoute => const CoursesRoute();
   PageRouteInfo get onboardingRoute => const PageRouteInfo(onboardingRouteName);
   PageRouteInfo get loginRoute => const PageRouteInfo(loginRouteName);
   PageRouteInfo get registrationRoute => const PageRouteInfo(registrationRouteName);
   PageRouteInfo get splashRoute => const PageRouteInfo(splashRouteName);
}
