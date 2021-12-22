import 'package:weather/data/data_provider/weather_api_provider.dart';
import 'package:weather/data/models/location.dart';
import 'package:weather/data/models/weather.dart';

class WeatherRepository {
  WeatherRepository({WeatherApiProvider? weatherApi})
      : _weatherApiProvider = weatherApi ?? WeatherApiProvider();

  final WeatherApiProvider _weatherApiProvider;

  Future<Location> locationSearch(String query) async {
    return _weatherApiProvider.locationSearch(query);
  }

  Future<Weather> getWeather(int locationId) async {
    return _weatherApiProvider.getWeather(locationId);
  }
}
