import 'package:equatable/equatable.dart';

class Parent extends Equatable {
  final String? title;
  final String? locationType;
  final int? woeid;
  final String? lattLong;

  const Parent({this.title, this.locationType, this.woeid, this.lattLong});

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        title: json['title'] as String?,
        locationType: json['location_type'] as String?,
        woeid: json['woeid'] as int?,
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
