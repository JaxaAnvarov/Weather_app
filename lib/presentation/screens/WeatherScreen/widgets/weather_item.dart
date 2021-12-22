import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/core/constants/constants.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem(
      {Key? key,
      required this.degrees,
      required this.day,
      required this.condition})
      : super(key: key);

  final String degrees;
  final String day;
  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 60, width: 60, child: getWeatherSvg(condition)),
          SizedBox(
            height: 10,
          ),
          Text(
            degrees + '°',
            style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
