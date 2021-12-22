import 'package:flutter/material.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          SizedBox(height: 60, width: 60, child: CircularProgressIndicator()),
    );
  }
}
