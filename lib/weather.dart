library weather;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather/pages/test_page.dart';
import 'package:weather/pages/weather_page.dart';
import 'package:weather/repository/remote_config_manager.dart';

class Weather {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      "weather": (context) => WeatherPage(),
      "weatherTest": (context) => TestPage(),
    };
  }

  static void initFirebase() {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    _initialization.then((value) {
      RemoteConfigManager().init();
    });
  }
}
