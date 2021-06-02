import 'package:http/http.dart' as http;
import 'package:weather/helpers/request_handler.dart';
import 'package:weather/repository/remote_config_manager.dart';

class ApiManager {
  static final ApiManager _apiManager = ApiManager();

  static const String WEATHER_URL = "http://api.openweathermap.org/data/2.5";

  static var remoteConfig = RemoteConfigManager.remoteConfigInstance;
  static ApiManager get instance => _apiManager;

  Future currentWeatherByCity(String cityName) async {
    try {
      Uri uri = Uri.parse(
          '$WEATHER_URL/weather?q=$cityName&appid=${remoteConfig.getString('weather_api_key')}&units=metric');
      var res = await RequestHandler.handleResponse(await http.get(uri));

      return res;
    } catch (e) {
      throw e;
    }
  }
}
