// Copyright 2021 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FirebaseAnalyticsScreenViewLogger {
  FirebaseAnalyticsScreenViewLogger({
    required this.analytics,
    Function(PlatformException error)? onError,
  }) : _onError = onError;

  final FirebaseAnalytics analytics;
  final void Function(PlatformException error)? _onError;

  void sendScreenView({RouteSettings? routeSettings, String? pageName}) {
    final String? screenName = routeSettings?.name ?? pageName;
    debugPrint('>> sendScreenView: $screenName');
    if (screenName != null) {
      analytics
          .logScreenView(
            screenName: screenName, 
            screenClass: screenName,
          )
          .catchError(
        (Object error) {
          final onError = _onError;
          if (onError == null) {
            debugPrint('$FirebaseAnalyticsObserver: $error');
          } else {
            onError(error as PlatformException);
          }
        },
        test: (Object error) => error is PlatformException,
      );
    }
    /*
    FirebaseAnalytics.instance.setUserProperty(
        name: 'user_property1', value: 'user_property_value_1');

    FirebaseAnalytics.instance.setUserProperty(
        name: 'user_property1', value: 'user_property_value_1');
    FirebaseAnalytics.instance.logEvent(
      name: "select_content",
      parameters: {
        "content_type": "content_type_1",
        "item_id": 'content_id_value_1',
      },
    );
    FirebaseAnalytics.instance.logEvent(
      name: "screen_view",
      parameters: {
        "screenName": screenName,
        "param2": 'paramvalue2',
      },
    );

     */
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
      //  'firebase_screen': screenName,
     //   'firebase_screen_class': '${screenName}Class',
      },
    );
  }
}
