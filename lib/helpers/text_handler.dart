abstract class TextHandler {
  static String formatTemperature(double? temperature) {
    return "${temperature!.toInt().toString()}°";
  }

  static String formatWindSpeed(double? windSpeed) {
    return '${windSpeed!.toInt()} km/h';
  }

  static String formatHumidity(int? humidity) {
    return '$humidity%';
  }

  static String formatPressure(int? pressure) {
    return '$pressure hPa';
  }
}
