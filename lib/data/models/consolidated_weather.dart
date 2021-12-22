import 'package:equatable/equatable.dart';

class ConsolidatedWeather extends Equatable {
  final int? id;
  final String? weatherStateName;
  final String? weatherStateAbbr;
  final String? windDirectionCompass;
  final String? created;
  final String? applicableDate;
  final double? minTemp;
  final double? maxTemp;
  final double? theTemp;
  final double? windSpeed;
  final double? windDirection;
  final double? airPressure;
  final int? humidity;
  final double? visibility;
  final int? predictability;

  const ConsolidatedWeather({
    this.id,
    this.weatherStateName,
    this.weatherStateAbbr,
    this.windDirectionCompass,
    this.created,
    this.applicableDate,
    this.minTemp,
    this.maxTemp,
    this.theTemp,
    this.windSpeed,
    this.windDirection,
    this.airPressure,
    this.humidity,
    this.visibility,
    this.predictability,
  });

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      ConsolidatedWeather(
        id: json['id'] as int?,
        weatherStateName: json['weather_state_name'] as String?,
        weatherStateAbbr: json['weather_state_abbr'] as String?,
        windDirectionCompass: json['wind_direction_compass'] as String?,
        created: json['created'] as String?,
        applicableDate: json['applicable_date'] as String?,
        minTemp: (json['min_temp'] as num?)?.toDouble(),
        maxTemp: (json['max_temp'] as num?)?.toDouble(),
        theTemp: (json['the_temp'] as num?)?.toDouble(),
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        windDirection: (json['wind_direction'] as num?)?.toDouble(),
        airPressure: (json['air_pressure'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
        visibility: (json['visibility'] as num?)?.toDouble(),
        predictability: json['predictability'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'weather_state_name': weatherStateName,
        'weather_state_abbr': weatherStateAbbr,
        'wind_direction_compass': windDirectionCompass,
        'created': created,
        'applicable_date': applicableDate,
        'min_temp': minTemp,
        'max_temp': maxTemp,
        'the_temp': theTemp,
        'wind_speed': windSpeed,
        'wind_direction': windDirection,
        'air_pressure': airPressure,
        'humidity': humidity,
        'visibility': visibility,
        'predictability': predictability,
      };

  @override
  List<Object?> get props {
    return [
      id,
      weatherStateName,
      weatherStateAbbr,
      windDirectionCompass,
      created,
      applicableDate,
      minTemp,
      maxTemp,
      theTemp,
      windSpeed,
      windDirection,
      airPressure,
      humidity,
      visibility,
      predictability,
    ];
  }
}
