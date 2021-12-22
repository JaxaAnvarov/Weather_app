import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String? title;
  final String? locationType;
  final int woeid;
  final String? lattLong;

  const Location({
    this.title,
    this.locationType,
    required this.woeid,
    this.lattLong,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        title: json['title'] as String?,
        locationType: json['location_type'] as String?,
        woeid: json['woeid'] as int,
        lattLong: json['latt_long'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'location_type': locationType,
        'woeid': woeid,
        'latt_long': lattLong,
      };

  @override
  List<Object?> get props => [title, locationType, woeid, lattLong];
}
