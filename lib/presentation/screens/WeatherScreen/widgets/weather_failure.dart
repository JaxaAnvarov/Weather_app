import 'package:flutter/material.dart';

class WeatherFailure extends StatelessWidget {
  const WeatherFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Align(
            alignment: Alignment.center,
            child: const Text('🙈', style: TextStyle(fontSize: 64))),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Something went wrong!',
          ),
        ),
      ],
    );
  }
}
