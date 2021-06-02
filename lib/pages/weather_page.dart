import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/helpers/image_loader.dart';
import 'package:weather/helpers/text_handler.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/widgets/status_container.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherBloc bloc = WeatherBloc();
  ImageLoader imageLoader = ImageLoader.instance;
  Image? selectedBackground;

  List? images;

  @override
  void initState() {
    super.initState();
    bloc.getWeatherByCity();
    int rand = Random().nextInt(6);
    images = [
      imageLoader.clearDay,
      imageLoader.rainDay,
      imageLoader.snowDay,
      imageLoader.clearNight,
      imageLoader.rainNight,
      imageLoader.snowNight,
    ];

    // selectedBackground = images![rand];
    selectedBackground = imageLoader.clearNight;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 27, 36, 1),
      body: Stack(
        children: [
          selectedBackground!,
          Container(
            width: double.infinity,
            height: double.infinity,
            child: StreamBuilder(
              stream: bloc.weatherStream,
              builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                if (snapshot.hasError) {
                  return Container(child: Center(child: Text('Deu erro')));
                }
                if (snapshot.hasData) {
                  WeatherModel? weather = snapshot.data;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: MediaQuery.of(context).padding.top,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${weather!.name}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          TextHandler.formatTemperature(
                                              weather.main!.temp),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 120,
                                          ),
                                        ),
                                      ],
                                    ),
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        '${weather.weather![0].description}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: Colors.white.withOpacity(0.1),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: StatusContainers(
                                            topText: TextHandler.formatHumidity(
                                                weather.main!.humidity),
                                            bottomText: 'Humidity',
                                          ),
                                        ),
                                        Container(
                                          width: 1.6,
                                          height: 24,
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                        Expanded(
                                          child: StatusContainers(
                                            topText: TextHandler.formatPressure(
                                                weather.main!.pressure),
                                            bottomText: 'Pressure',
                                          ),
                                        ),
                                        Container(
                                          width: 1.6,
                                          height: 24,
                                          color: Colors.white.withOpacity(0.4),
                                        ),
                                        Expanded(
                                          child: StatusContainers(
                                            topText:
                                                TextHandler.formatWindSpeed(
                                                    weather.wind!.speed),
                                            bottomText: 'Wind',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
