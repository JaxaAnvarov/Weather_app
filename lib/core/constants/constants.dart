import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Constants {
  // App
  static final appTitle = 'Weather App';
  static final WEATHER_BASE_URL = "www.metaweather.com";
}

enum WeatherCondition {
  clear,
  rainy,
  cloudy,
  snowy,
  thunder,
  unknown,
}

WeatherCondition getCondition(String condition) {
  switch (condition) {
    case 'Clear':
      return WeatherCondition.clear;

    case 'Heavy Cloud':
    case 'Light Cloud':
      return WeatherCondition.cloudy;

    case 'Heavy Rain':
    case 'Light Rain':
    case 'Showers':
      return WeatherCondition.rainy;

    case 'Thunderstorm':
      return WeatherCondition.thunder;

    case 'snow':
    case 'Sleet':
    case 'Hail':
      return WeatherCondition.snowy;

    default:
      return WeatherCondition.unknown;
  }
}

String toEmoji(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.clear:
      return '☀️';
    case WeatherCondition.rainy:
      return '🌧️';
    case WeatherCondition.cloudy:
      return '☁️';
    case WeatherCondition.snowy:
      return '🌨️';
    case WeatherCondition.thunder:
      return '⚡';
    case WeatherCondition.unknown:
    default:
      return '❓';
  }
}

Widget getWeatherSvg(WeatherCondition condition) {
  switch (condition) {
    case WeatherCondition.clear:
      return SvgPicture.asset('assets/sun.svg');
    case WeatherCondition.rainy:
      return SvgPicture.asset('assets/rainy.svg');
    case WeatherCondition.cloudy:
      return SvgPicture.asset('assets/clouds.svg');
    case WeatherCondition.snowy:
      return SvgPicture.asset('assets/snowy.svg');
    case WeatherCondition.thunder:
      return SvgPicture.asset('assets/storm.svg');
    case WeatherCondition.unknown:
    default:
      return SvgPicture.asset('assets/unknown.svg');
  }
}
