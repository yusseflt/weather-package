import 'package:http/http.dart' as http;
import 'package:weather/helpers/request_handler.dart';

class ApiManager {
  static final ApiManager _apiManager = ApiManager();
  static const String WEATHER_URL = "http://api.openweathermap.org/data/2.5";
  static ApiManager get instance => _apiManager;
  String? _weatherKey;

  void addKey(String key) {
    _weatherKey = key;
  }

  Future currentWeatherByCity(String cityName) async {
    try {
      Uri uri = Uri.parse(
          '$WEATHER_URL/weather?q=$cityName&appid=$_weatherKey&units=metric');
      var res = await RequestHandler.handleResponse(await http.get(uri));

      return res;
    } catch (e) {
      throw e;
    }
  }
}
