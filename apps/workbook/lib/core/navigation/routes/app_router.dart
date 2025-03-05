// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../features/courses/ui/screens/course_form_screen.dart';
import '../../../features/courses/ui/screens/course_view_screen.dart';
import '../../../features/courses/ui/screens/courses_screen.dart';
import '../../../features/disable_screen/domain/riverpod/disable_screen_provider.dart';
import '../../../features/lessons/ui/screens/lesson_form_screen.dart';
import '../../../features/lessons/ui/screens/lesson_view_screen.dart';
import '../../../features/lessons/ui/screens/lessons_screen.dart';
import '../../../features/users/profile/ui/screens/password_edit_screen.dart';
import '../../../features/users/profile/ui/screens/photo_edit_screen.dart';
import '../../../features/users/profile/ui/screens/profile_form_screen.dart';
import '../../../features/users/profile/ui/screens/profile_view_screen.dart';
import '../../../features/users/students/domain/models/student.dart';
import '../../../features/users/students/ui/screens/student_form_screen.dart';
import '../../../features/users/students/ui/screens/student_view_screen.dart';
import '../../../features/users/students/ui/screens/students_screen.dart';
import '../../../features/users/unauthorized/ui/screens/first_login_screen.dart';
import '../../../features/users/unauthorized/ui/screens/login_screen.dart';
import '../../../features/users/unauthorized/ui/screens/registration_screen.dart';
import '../../app_launch/splash_screen/ui/screens/splash_screen.dart';
import '../../firebase/analytics/custom_firebase_analytics_observer.dart';
import '../constants/default_routes.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  Ref? ref;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      usesPathAsKey: true,
      page: SplashRoute.page,
      path: '/splash-screen',
    ),
    AutoRoute(page: CoursesRoute.page, path: '/courses-screen'),
    AutoRoute(page: FirstLoginRoute.page, path: '/first-login-screen'),
    AutoRoute(page: LoginRoute.page, path: '/login-screen'),
    AutoRoute(page: RegistrationRoute.page, path: '/registration-screen'),
    AutoRoute(page: CourseFormRoute.page, path: '/course-form-screen'),
    AutoRoute(page: CourseViewRoute.page, path: '/course-view-screen'),
    AutoRoute(page: LessonFormRoute.page, path: '/lesson-form-screen'),
    AutoRoute(page: LessonViewRoute.page, path: '/lesson-view-screen'),
    AutoRoute(page: LessonsRoute.page, path: '/lessons-screen'),
    AutoRoute(page: PasswordEditRoute.page, path: '/password-edit-screen'),
    AutoRoute(page: PhotoEditRoute.page, path: '/photo-edit-screen'),
    AutoRoute(page: ProfileFormRoute.page, path: '/profile-form-screen'),
    AutoRoute(page: ProfileViewRoute.page, path: '/profile-view-screen'),
    AutoRoute(page: StudentFormRoute.page, path: '/student-form-screen'),
    AutoRoute(page: StudentViewRoute.page, path: '/student-view-screen'),
    AutoRoute(page: StudentsRoute.page, path: '/students-screen'),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  /// optionally add root guards here
  @override
  List<AutoRouteGuard> get guards => [
    authGuard, ///add  guard instance
  ];

  /// AutoRouteGuard to handle routing when user is unauthenticated
  final authGuard = AuthGuard();

  @override
  void onPopPage(Route<dynamic> route, RouteData data) {
    super.onPopPage(route, data);
    if (kDebugMode) print('>>> Popping page: ${route.settings.name}');
    ref!.read(disableScreen.notifier).state = false; // Unlock the screen after navigation
  }
}

/// Redirects to unauthorized routes in case if the user is not logged in
/// - if the user has passed onboarding then redirect to login screen
/// - if the user is new then redirect to onboarding screen
class AuthGuard extends AutoRouteGuard {
  Ref? ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = FirebaseAuth.instance.currentUser != null;
    // handle navigating to splash screen when app is launched
    if(router.stack.isEmpty) {
      if(kDebugMode) print('>> ${router.current.name}: handle navigating to splash screen');
      resolver.next();
      return;
    }
    // handle navigating to home route if user is authenticated
    if(isAuthenticated && 
      resolver.route.name == DefaultRoutes().homeRoute.routeName &&
      router.stackData.isNotEmpty &&
      router.current.name != DefaultRoutes().onboardingRoute.routeName &&
      router.current.name != DefaultRoutes().loginRoute.routeName &&
      router.current.name != DefaultRoutes().registrationRoute.routeName
    ) {
      if(kDebugMode) print('>> ${router.current.name}: handle navigating to home route');
      router.popUntilRoot();
      return;
    }
    // if user is authenticated
    // or user is unauthorized and navigating to the unauthorized route
    // then continue navigation
    if(isAuthenticated) {
      if(kDebugMode) print('>> ${router.current.name}: handle navigating (user authenticated)');
      // continue navigation
      _resolveNext(resolver);
      return;
    } else if (router.current.name == DefaultRoutes().onboardingRoute.routeName ||
        router.current.name == DefaultRoutes().loginRoute.routeName ||
        router.current.name == DefaultRoutes().registrationRoute.routeName) {
      // redirect to the unauthorized route if iser is logged out
      if(kDebugMode) print('>> ${router.current.name}: handle navigating (user is logget out)');
      _resolveNext(resolver);
      return;
    } else {
      // block navigation otherwise
      if(kDebugMode) print('>> ${router.current.name}: block navigaition');
      resolver.resolveNext(false);
    }
  }

  /// handles resolver.next();
  void _resolveNext(NavigationResolver resolver) {
    resolver.next();
    ref!.read(disableScreen.notifier).state = false; // Unlock the screen after navigation
    _logScreenView(resolver.route.name);
  }

  // not used
  // handles resolver.redirect(route);
  // void _resolveRedirect(NavigationResolver resolver) {
  //   resolver.redirect(DefaultRoutes().loginRoute);
  //   ref!.read(disableScreen.notifier).state = false; // Unlock the screen after navigation
  //    _logScreenView(resolver.route.name);
  // }

  // Log screen view in firebase analytics
  void _logScreenView(String pageName) {
    FirebaseAnalyticsScreenViewLogger(
      analytics: FirebaseAnalytics.instance,
    )
    .sendScreenView(pageName: pageName);
  }
}