# Code generation (Singletons, freezed models etc.), Analizer (lint)
GetIt implementation
## Steps to implement:
    1) Add build runner packages
        > flutter pub add dev:build_runner
    2) Add freezed packages
        > flutter pub add dev:freezed
        > flutter pub add dev:freezed_annotation
        > flutter pub add json_annotation
        > flutter pub add dev:json_serializable  // for g.dart files
        > flutter pub add dev:custom_lint
        > flutter pub add dev:freezed_lint
        > flutter pub add dev:rxdart
    3) Set up get_it
        2.1) Add get_it packages
            > flutter pub add injectable
            > flutter pub add get_it
            > flutter pub add dev:injectable_generator
            
        2.2) Add injection.dart file for injections generation
        ------------
        import 'injection.config.dart';

        final getIt = GetIt.instance;

        @injectableInit
        void configureInjection(String env) {
            getIt.init(environment: env);
        }
        ------------

    4) Set up analysis_options.yaml for flutter analyzer
        4.1) Add flutter_lints package
            > flutter pub add dev:flutter_lints
        4.2) Add custom_lint as a plugin in the analysis_options.yaml
            > analyzer:
                plugins:
                    - custom_lint
    5) Add melos package
        > flutter pub add dev:melos
    6) Add flutter_launcher_icons package to generate the app icon (launcher icon)
        > flutter pub add dev:flutter_launcher_icons

## Generate code
    flutter pub run build_runner build --delete-conflicting-outputs


# App assets (Icons and Images), UI packages
Add static assets used in the application.
## Steps to implement:
    1) in pubspec.yaml change "assets" block:
        assets:
            - assets/icons/
            - assets/images/
    2) In the app directory add "assets" folder
        - assets
            - icons
            - images
    3) Add cupertino (IOS) icons
        > flutter pub add cupertino_icons
    4) Add loader_overlay package for async loading UI
        > flutter pub add loader_overlay


# App navigation (auto_route)
Routing implemented through auto_route.
## Steps to implement:
    1) Add auto_route packages
        > flutter pub add auto_route
        > flutter pub add dev:auto_route_generator
        > dart pub global activate auto_route_generator
    2) Add navigation_global_key.dart file for navigation without context
        -----------
        final GlobalKey<NavigatorState> globalNavigatorKey =
            GlobalKey<NavigatorState>();
        final GlobalKey<ScaffoldMessengerState> globalScaffoldMessengerKey =
            GlobalKey<ScaffoldMessengerState>();
        ------------


# Riverpod
Riverpod implementation for UI state management.
## Steps to implement:
    1) Add riverpod packages
        > flutter pub add flutter_riverpod
        > flutter pub add riverpod_annotation


# Firebase Services (Database, Crashlytics, Analytics, Push Notifications)
Firebase services (Database, Crashlytics, Analytics, Push Notifications, Storage)
## Steps to implement:
    1) Add Firebase core packages
        > flutter pub add firebase_core
    2) Add Firebase Auth package
        > flutter pub add firebase_auth
    3) Add Firebase database packages (firestore + storage)
        > flutter pub add cloud_firestore
        > flutter pub add firebase_storage
    4) Add Firebase analytics package
        > flutter pub add firebase_analytics

    5) Set Up Push Notifications
        5.1) Add Push Notifications package to send notifications basing on Firebase functions
            > flutter pub add firebase_messaging
        5.2) Add Local Notifications to send local notification to the current device
            > flutter pub add flutter_local_notifications
        5.3) In AndroidManifest.xml add meta_data element with default notifications channel:
            ------------
            <application ...>
                <meta-data
                    android:name="com.google.firebase.messaging.default_notification_channel_id"
                    android:value="workbook_general"/>
            </application>
            ------------
        
