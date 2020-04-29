import 'dart:convert';

import 'package:date_time_format/date_time_format.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';

class Point extends Equatable {
  /// The latitude of this position in degrees normalized to the interval -90.0 to +90.0 (both inclusive).
  final double latitude;

  /// The longitude of the position in degrees normalized to the interval -180 (exclusive) to +180 (inclusive).
  final double longitude;

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned value is 0.0.
  final double altitude;

  /// The speed at which the devices is traveling in meters per second over ground.
  ///
  /// The speed is not available on all devices. In these cases the value is 0.0.
  final double speed;
  final DateTime timestamp;

  Point(
      {this.latitude,
      this.longitude,
      this.altitude,
      this.speed,
      this.timestamp});
  Point._(
      {this.latitude,
      this.longitude,
      this.altitude,
      this.speed,
      this.timestamp});

  @override
  List<Object> get props => [
        latitude,
        longitude,
        altitude,
        speed,
        timestamp,
      ];

  static Point fromPosition(Position position) {
    return Point._(
        latitude: position.latitude,
        longitude: position.longitude,
        altitude: position.altitude,
        speed: position.speed,
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
      'time': DateTimeFormat.format(timestamp, format: 'D, M j, H:i:s:v:u'),
      'altitude': altitude,
      'speed ': speed
    };
  }
}
