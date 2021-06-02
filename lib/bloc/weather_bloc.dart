import 'package:rxdart/rxdart.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repository/api_manager.dart';

class WeatherBloc {
  PublishSubject<WeatherModel>? _weatherSubject;
  Stream<WeatherModel> get weatherStream => _weatherSubject!.stream;
  ApiManager _apiManager = ApiManager.instance;

  WeatherBloc() {
    _weatherSubject = PublishSubject<WeatherModel>();
  }

  Future getWeatherByCity() async {
    try {
      var res = await _apiManager.currentWeatherByCity('florianopolis');

      WeatherModel weather = WeatherModel.fromJson(res);

      _weatherSubject!.sink.add(weather);
    } catch (e) {
      _weatherSubject!.addError(e);
    }
  }
}
