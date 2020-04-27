import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';

class Point extends Equatable {
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  Point({this.latitude, this.longitude, this.timestamp});
  Point._({this.latitude, this.longitude, this.timestamp});

  @override
  List<Object> get props => [
        latitude,
        longitude,
        timestamp,
      ];

  static Point fromPosition(Position position) {
    return Point._(
        latitude: position.latitude,
        longitude: position.longitude,
        timestamp: position.timestamp);
  }

  @override
  String toString() {
    return 'Lat: $latitude, Long: $longitude';
  }

  Map toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'time': Jiffy(timestamp.add(Duration(hours: 2))).Hms,
    };
  }
}
