import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.scaffoldColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Metropolis',
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}

class AppSizes {
  static const double radiusSize = 20;
  static const double bottomBarRadiusSize = 40;
}

class AppColors {
  static const bottomBarColor = Color(0xff272F3F);
  static const addButtonColor = Color(0xff89b0ae);
  static const scaffoldColor = Color(0xff1A1E25);
  static const lightPink = Color(0xffE4DEFF);
  static const lightBlue = Color(0xffD3E9FF);
  static const searchBarColor = Color(0xffC5C5C5);
  static const cardBlue = Color(0xffa2cffc);
  static const cardGrey = Color(0xffF5F5F5);
}
