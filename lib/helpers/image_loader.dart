import 'package:flutter/material.dart';

class ImageLoader {
  static ImageLoader instance = ImageLoader._();

  Image clearDay = Image.network(
    'https://media.giphy.com/media/Ali32O00QGr3tXjobB/giphy.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );
  Image clearNight = Image.network(
    'https://media.giphy.com/media/vE1Jn6lAPxSeoa8jFd/giphy.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );
  Image rainDay = Image.network(
    'assets/gifs/rain.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );
  Image rainNight = Image.network(
    'assets/gifs/rain-night.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );
  Image snowDay = Image.network(
    'assets/gifs/snow.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );
  Image snowNight = Image.network(
    'assets/gifs/snow-night.gif',
    height: double.infinity,
    fit: BoxFit.cover,
  );

  ImageLoader._();
}
