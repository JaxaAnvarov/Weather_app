import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherDetailItem extends StatelessWidget {
  const WeatherDetailItem({Key? key, required this.image, required this.data})
      : super(key: key);

  final Widget image;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70, width: 70, child: image),
          SizedBox(height: 10),
          Text(
            data,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
