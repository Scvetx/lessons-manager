import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../getit/injection.dart';
import '../navigation/routes/app_router.dart';

class Utils {
  /// true if flutter tests are running
  static bool isTest() => Platform.environment.containsKey('FLUTTER_TEST');

  /// all active snackbars
  static final List<Flushbar> _activeSnackBars = [];

  /// show snackbar (uses current context from auto_route)
  static Future<void> showSnackBar({
    required String content,
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
  }) async {
    try {
      final currentContext = getIt<ContextVariables>().currentContext;
      if (currentContext == null) return;

      final flushbar = Flushbar(
        key: Key(content),
        messageText: Text(content),
        backgroundColor: backgroundColor ??
             Theme.of(currentContext).snackBarTheme.backgroundColor ??
             Colors.blueGrey,
        titleColor: Theme.of(currentContext).snackBarTheme.backgroundColor ??
             Colors.black,
        duration: duration,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL, // swipe dismiss
      );
      _activeSnackBars.add(flushbar);
      await flushbar.show(currentContext);
      _activeSnackBars.remove(flushbar);

    } catch (e, stack) {
      Utils.handleException(e, stack, 
        'Error while showing snackbar',
      );
    }
  }
  /// dismiss all active snackbars
  static Future<void> clearSnackbars() async {
    for(final snackbar in _activeSnackBars) {
      try {
        await snackbar.dismiss();
      // the snackbar might be already not in the list 
      // at the moment, so exceptions are ignored
      // ignore: empty_catches
      } catch (e) {}
    }
  }
  

  static void handleException(
    Object e,
    StackTrace stack,
    String? logErrMsg, {
    String? snackbarErrMsg,
  }) {
    if(kDebugMode && logErrMsg != null) {
      debugPrint('>>> Exception: $logErrMsg :: $e :: $stack');
    }
    
    if(snackbarErrMsg != null) {
      Utils.showSnackBar(content: snackbarErrMsg);
    }
  }
}


/// Helps to access context variables outside of Widgets.
/// 
/// *L10n is saved to l10n_global during app initialization 
/// *and refreshes when user restarts the app
@LazySingleton()
class ContextVariables {
  BuildContext? get currentContext => 
    getIt<AppRouter>().navigatorKey.currentContext;
}