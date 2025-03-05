import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../getit/injection.dart';
import '../../navigation/global_key/navigation_global_key.dart';
import '../../navigation/routes/app_router.dart';
import '../../ui/app_styles/app_style.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAnalyticsObserver = FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // ignore: avoid_redundant_argument_values
      showPerformanceOverlay: false,
      // navigation  configs
      scaffoldMessengerKey: globalScaffoldMessengerKey,
      routerConfig: getIt<AppRouter>().config(
        navigatorObservers: () => [
          firebaseAnalyticsObserver,
        ],
      ),
      // theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme, // TODO: setup dark theme
      // locales
      supportedLocales: AppConstants.supportedLocales,
      localizationsDelegates: AppConstants.localizationsDelegates,
    );
  }
}