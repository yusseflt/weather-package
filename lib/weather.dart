library weather;

import 'package:flutter/material.dart';
import 'package:weather/pages/test_page.dart';
import 'package:weather/pages/weather_page.dart';
import 'package:weather/repository/api_manager.dart';

class Weather {
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      "weather": (context) => WeatherPage(),
      "weatherTest": (context) => TestPage(),
    };
  }

  static addApiKey(String apiKey) {
    ApiManager.instance.addKey(apiKey);
  }
}
