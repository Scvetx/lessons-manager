import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../l10n/app_localizations.dart';

/// Stores Localizations values for the current App launch
/// Restart App to get updated localization values.
/// Call init to update localization values.
@lazySingleton
class Labels {
  /// l10n for the current App launch
  /// Will be refreshed when MaterialApp is rebuilt
  AppLocalizations get l10n => _l10n!;

  late final AppLocalizations? _l10n;
  bool isInitialized = false;

  void init(BuildContext appContext) {
    if(isInitialized) return;
    _l10n = AppLocalizations.of(appContext);
    isInitialized = true;
  }
}