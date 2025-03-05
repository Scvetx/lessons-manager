import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../../firebase_options.dart';
import '../../firebase/push_notifications/handlers/messaging_background.dart';
import '../../getit/injection.dart';
import '../../riverpod/observers/logger.dart';
import 'app.dart';

/// Use [AppLauncher] class in the main method to initialize the app
class AppLauncher {
  
  /// Run async operations and then start the app
  static Future<void> launch() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    // Init GetIt
    configureInjection(Environment.prod);

    //await PushNotifications().initialize(firebaseMessagingBackgroundHandler);
    //await PushNotifications().getToken();

    // await FirebaseAnalytics.instance.setUserId(
    //   id: getIt<FirebaseAuthRepository>().userId,
    // );

    runApp(ProviderScope(
        observers: [Logger()],
        child: const App(),
      ),
    );
  }
}

  