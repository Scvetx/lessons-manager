import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workbook/core/constants/app_constants.dart';
import 'package:workbook/core/getit/injection.dart';
import 'package:workbook/core/navigation/routes/app_router.dart';
import 'package:workbook/l10n/app_localizations.dart';

/// MaterialApp.router for unit tests
class TestApp {
  final router = getIt<AppRouter>();

  dynamic getMaterialApp () => ProviderScope(
      child: MaterialApp.router(
        routerConfig: getIt<AppRouter>().config(),
        localizationsDelegates: AppConstants.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
}