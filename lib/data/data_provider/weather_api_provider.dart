import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/data/models/location.dart';
import 'package:weather/data/models/weather.dart';

class LocationRequestFailure implements Exception {}

class LocationNotFoundFailure implements Exception {}

class WeatherRequestFailure implements Exception {}

class WeatherNotFoundFailure implements Exception {}

class WeatherApiProvider {
  Future<Location> locationSearch(String query) async {
    final locationRequest = Uri.https(
      Constants.WEATHER_BASE_URL,
      '/api/location/search',
      <String, String>{'query': query},
    );
    final locationResponse = await http.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final locationJson = jsonDecode(
      locationResponse.body,
    ) as List;

    if (locationJson.isEmpty) {
      throw LocationNotFoundFailure();
    }

    return Location.fromJson(locationJson.first as Map<String, dynamic>);
  }

  Future<Weather> getWeather(int locationId) async {
    final weatherRequest =
        Uri.https(Constants.WEATHER_BASE_URL, '/api/location/$locationId');
    final weatherResponse = await http.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw WeatherNotFoundFailure();
    }


    return Weather.fromJson(bodyJson);
  }
}
