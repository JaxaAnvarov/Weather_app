import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeather(String? query) async {
    if (query == null || query.isEmpty) return;

    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final location = await _weatherRepository.locationSearch(query);
      final woeid = location.woeid;
      final weather = await _weatherRepository.getWeather(woeid);

      emit(state.copyWith(status: WeatherStatus.success, weather: weather));
    } on Exception {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
}
