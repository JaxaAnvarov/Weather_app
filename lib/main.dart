import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/presentation/screens/WeatherScreen/weather_screen.dart';

void main() {
  runApp(WeatherApp(weatherRepository: WeatherRepository()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}