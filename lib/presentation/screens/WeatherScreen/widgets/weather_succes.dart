import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constants/constants.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/weather_detail_item.dart';
import 'package:weather/presentation/screens/WeatherScreen/widgets/weather_item.dart';

class WeatherSuccess extends StatelessWidget {
  const WeatherSuccess({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    var weatherData = weather.consolidatedWeather;
    var condition =
        getCondition(weatherData!.first.weatherStateName.toString());

    const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(2, 1),
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            weather.title.toString() + ' ' + toEmoji(condition),
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 50),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            weatherData.first.theTemp!.toStringAsFixed(1) + '°',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 50),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'H:' +
                weatherData.first.maxTemp!.toStringAsFixed(1) +
                '°' +
                '   L:' +
                weatherData.first.minTemp!.toStringAsFixed(1) +
                '°',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SizedBox(
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ListView.builder(
                  itemCount: weatherData.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return WeatherItem(
                      degrees: weatherData[index].theTemp!.toStringAsFixed(1),
                      day: DateFormat('EEEE').format(
                          DateTime.parse(weatherData[index].applicableDate!)),
                      condition: getCondition(
                        weatherData[index].weatherStateName.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          StaggeredGridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            staggeredTiles: _staggeredTiles,
            children: <Widget>[
              WeatherDetailItem(
                  image: Image(
                    image: AssetImage('assets/sunrise.png'),
                  ),
                  data: DateFormat.Hm()
                      .format(DateTime.parse(weather.sunRise!).toLocal())),
              WeatherDetailItem(
                  image: Image(
                    image: AssetImage('assets/sunset.png'),
                  ),
                  data: DateFormat.Hm()
                      .format(DateTime.parse(weather.sunSet!).toLocal())),
              WeatherDetailItem(
                  image: Image(
                    image: AssetImage('assets/wind.png'),
                  ),
                  data:
                      (weatherData.first.windSpeed! * 1.61).toStringAsFixed(2) +
                          ' km/h'),
              WeatherDetailItem(
                  image: Image(
                    image: AssetImage('assets/humidity.png'),
                  ),
                  data: weatherData.first.humidity.toString() + ' %'),
              WeatherDetailItem(
                  image: Image(
                    image: AssetImage('assets/compass.png'),
                  ),
                  data: weatherData.first.windDirectionCompass.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
