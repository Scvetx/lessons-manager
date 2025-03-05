import 'package:auto_route/auto_route.dart';
import 'package:change_case/change_case.dart';
import 'package:collection/collection.dart';

import '../getit/injection.dart';
import 'routes/app_router.dart';

/// Navigation class which has useful methods for routing.
/// Some methods call a few navigator methods one after another one.
/// so you don't need to duplicate those lines in the code.
class NavigationService {
  /// Returns true if [routeName] is currently in routes stack (opened)
  static bool containsRoute (String routeName) {
    final activeScreen = getIt<AppRouter>().stackData.firstWhereOrNull(
      (routeData) => routeData.name == routeName,
    );
    return activeScreen != null;
  }

// -------- NAVIGATION BY ROUTE NAME ---------
  static Future<dynamic> pushByRouteName(String routeName, {Object? args}) {
    final path = _getPathByRouteName(routeName);
    return pushByPath(
      path,
    );
  }

  static Future<dynamic> popAndPushByRouteName(String routeName, {
    Object? args,
  }) {
    final path = _getPathByRouteName(routeName);
    return popAndPushByPath(
      path,
    );
  }
    
// -------- NAVIGATION BY PATH ---------
  static Future<dynamic> pushByPath(String path, {Object? args}) =>
    getIt<AppRouter>().pushNamed(
      path,
    );

  static Future<dynamic> popAndPushByPath(String path, {Object? args}) {
    pop();
    return getIt<AppRouter>().pushNamed(
      path,
    );
  }

// -------- NAVIGATION BY ROUTE ---------
  /// Push [route]. passed int he params.
  static Future<dynamic> push(PageRouteInfo<dynamic> route) => 
    getIt<AppRouter>().push(
      route,
    );

  /// pop current route and push [route] passed in the params.
  static Future<dynamic> popAndPush(PageRouteInfo<dynamic> route) {
    pop();
    return getIt<AppRouter>().push(
      route,
    );
  }

  /// Pop until root route and push [route] passed in the params.
  static Future<dynamic> clearRouteAndPush(PageRouteInfo<dynamic> route) {
    if(getIt<AppRouter>().canPop()) {
      getIt<AppRouter>().popUntilRoot();
    }
    return getIt<AppRouter>().popAndPush(route);
  }

  // Pop until root route.
  static void clearRoute() {
    if(getIt<AppRouter>().canPop()) {
      getIt<AppRouter>().popUntilRoot();
    }
  }

  /// Replace current route
  static Future<void> replace(PageRouteInfo<dynamic> route) => 
    getIt<AppRouter>().replace(route);

  /// Replace all the curent routes stack with 1 route
  static Future<void> replaceAll(PageRouteInfo<dynamic> route) => 
    getIt<AppRouter>().replaceAll([route]);


// -------- NAVIGATION BY CURRENT STATE ---------
  /// Pop the current route.
  static void pop({
    bool? result,
  }) {
    if (result == null) {
      getIt<AppRouter>().maybePop();
    } else {
      getIt<AppRouter>().maybePop(result);
    }
  }

  static void forcePop() {
    getIt<AppRouter>().popForced();
  }

  /// Pop until root
  static void popUntilRoot({
    bool? result,
  }) => getIt<AppRouter>().popUntilRoot();

  /// Pop until root
  static void popUntilRoute(String routeName) => 
    getIt<AppRouter>().popUntilRouteWithName(routeName);

  /// Get the path associated with the given route name.
  /// This path can be used in pushNamed navigation.
  static String _getPathByRouteName (String routeName) {
    final screenName = routeName.replaceAll('Route', 'Screen');
    return '/${screenName.toParamCase()}';
  }
}
