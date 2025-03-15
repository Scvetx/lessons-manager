import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';

import '../../l10n/app_localizations.dart';

class AppConstants {
  AppConstants._();

  static const double bottomHeightPadding = 2;
  static const double bottomHeight = 44;

  static const supportedLocales = [
    Locale('en'), // English
    Locale('ru'), // Russian
  ];

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
