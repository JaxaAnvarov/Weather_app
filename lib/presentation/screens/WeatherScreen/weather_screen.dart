import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/logic/cubit/weather_cubit.dart';
import 'package:weather/presentation/screens/SearchScreen/search_screen.dart';
import 'package:pedantic/pedantic.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/WeatherLoading.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/weather_empty.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/weather_failure.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/weather_succes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(context.read<WeatherRepository>())..getWeather('Paris'),
      child: WeatherView(),
    );
//      child: WeatherView(),
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());
          unawaited(context.read<WeatherCubit>().getWeather(city));
        },
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          switch (state.status) {
            case WeatherStatus.initial:
              return WeatherEmpty();
            case WeatherStatus.loading:
              return WeatherLoading();
            case WeatherStatus.failure:
              return WeatherFailure();
            case WeatherStatus.success:
              return WeatherSuccess(
                weather: state.weather,
              );
            default:
              return WeatherFailure();
          }
        },
      ),
    );
  }
}
